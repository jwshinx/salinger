require 'moneyable'                                   
require 'formatable'
require 'exceptions' 

class Order < ActiveRecord::Base
 include Moneyable 
 include Formatable  
 include Exceptions
 include Trackable
 
 attr_accessible :created_by, :customer_id, :ispaid, :paid_amount, :paid_date, :purchase_amount, :purchase_date, :updated_by, :line_items_attributes, :fyis_attributes, :order_status_id
 has_many :line_items, :class_name => 'OrderLineItem', :dependent => :destroy
 has_many :fyis, :as => :notable, :dependent => :destroy
 belongs_to :status, :class_name => 'OrderStatus', :foreign_key => 'order_status_id'
 belongs_to :customer
 #validates :purchase_date, :presence => true, :length => { :minimum => 1 }
 validates :purchase_date, :presence => true
 accepts_nested_attributes_for :line_items, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :fyis, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
 
 scope :latest, order('created_at desc')              
 
 def summary
   "#{customer.fullname}: Order ##{id}  Amount: $#{cents_to_dollars(purchase_amount)}  Date: #{mmddyy_date(purchase_date)}"
 end
 def reduce_inventory                           
   line_items.each do |li|                                
     li.product.count = li.product.count - li.quantity 
     li.product.save  
   end            
 end
 def process_subtotals_of_line_items options, current_user, order_total
   self.line_items.each_with_index do |oli, i|
    set_creator_and_updater oli, current_user
    price = Product.find(options[:customer][:orders_attributes]['0'][:line_items_attributes][i.to_s][:product_id]).price
    oli.price = price 
    quantity = options[:customer][:orders_attributes]['0'][:line_items_attributes][i.to_s][:quantity].to_i
    order_total += price * quantity
    oli.subtotal = price * quantity 
   end   
   order_total
 end  
 alias_method :blurb, :summary                
end
