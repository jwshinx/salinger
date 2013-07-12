require 'moneyable'                                   
require 'formatable'
require 'exceptions' 

class Order < ActiveRecord::Base
 include Moneyable 
 include Formatable  
 include Exceptions
 
 attr_accessible :created_by, :customer_id, :ispaid, :paid_amount, :paid_date, :purchase_amount, :purchase_date, :updated_by, :line_items_attributes, :fyis_attributes, :order_status_id
 has_many :line_items, :class_name => 'OrderLineItem', :dependent => :destroy
 has_many :fyis, :as => :notable, :dependent => :destroy
 belongs_to :status, :class_name => 'OrderStatus', :foreign_key => 'order_status_id'
 belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
 belongs_to :updater, :class_name => "User", :foreign_key => "updated_by"
 belongs_to :customer
 #validates :purchase_date, :presence => true, :length => { :minimum => 1 }
 validates :purchase_date, :presence => true
 accepts_nested_attributes_for :line_items, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true
 accepts_nested_attributes_for :fyis, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true              
 
 def blurb
   "#{customer.fullname}: Order ##{id}  Amount: $#{cents_to_dollars(purchase_amount)}  Date: #{mmddyy_date(purchase_date)}"
 end
 def reduce_inventory         
   line_items.each { |li| raise Exceptions::InadequateInventory if li.quantity > li.product.count }
   line_items.each do |li|  
     puts "---> ri: #{li.product.name} - #{li.product.count}"
     reduced_count = li.product.count - li.quantity
     li.product.update_attributes({count: reduced_count})
   end
 end                  
end
