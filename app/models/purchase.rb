#require 'trackable'
#require 'formatable'
#require 'exceptions'

class Purchase
 include Trackable
 include Formatable     
 include Exceptions

 attr_accessor :customer

 def initialize options, current_user
  @customer = Customer.new options[:customer]
  set_creator_and_updater @customer, current_user
  set_creator_and_updater_to_customer_children current_user
  process_order options, current_user
 end
 def process_order options, current_user
   @customer.orders.each do |o|
    if o.new_record?
     check_for_adequate_inventory o
     o.fyis.each { |ofyi| set_creator_and_updater ofyi, current_user }
     o.paid_amount = convert_dollars_to_cents( options[:customer][:orders_attributes]['0'][:paid_amount] )
     order_total = 0
     set_creator_and_updater o, current_user   
     order_total = o.process_subtotals_of_line_items( options, current_user, order_total )        
     o.purchase_amount = apply_discount(o, order_total, options[:discount], current_user)
     raise Exceptions::ExcessiveDiscountAmount if o.purchase_amount < 0                                     
     o.purchase_date = Date.strptime(options[:customer][:orders_attributes]['0'][:purchase_date], '%m/%d/%Y')
     o.paid_date = Date.strptime(
      options[:customer][:orders_attributes]['0'][:paid_date], '%m/%d/%Y'
     ) unless options[:customer][:orders_attributes]['0'][:paid_date].blank?                                       
    end
   end
 end                     
 def check_for_adequate_inventory(order)
   order.line_items.each { |li| raise Exceptions::InadequateInventory if li.quantity > li.product.count }
 end
 def set_creator_and_updater_to_customer_children current_user
   @customer.fyis.each { |f| set_creator_and_updater f, current_user }
   @customer.todos.each { |t| set_creator_and_updater t, current_user }
   @customer.addresses.each { |a| set_creator_and_updater a, current_user }
 end  
 def apply_discount(order, total, dollars, current_user)    
   Rails.logger.debug "---> Purchase.init apply_discount 1"
   return total if dollars.blank?       
   Rails.logger.debug "---> Purchase.init apply_discount 2"
   cents_discount = convert_dollars_to_cents(dollars)
   Rails.logger.debug "---> Purchase.init apply_discount 3 #{total} #{cents_discount}"
   set_creator_and_updater(order.fyis.build({content: "Discount of $#{dollars} applied."}), current_user) if cents_discount > 0 
   Rails.logger.debug "---> Purchase.init apply_discount 4"
   total - cents_discount
 end
 def save
  ActiveRecord::Base.transaction do
   customer.save!
   customer.orders.latest.first.reduce_inventory
  end
 end
 def to_s
  'purchase'
 end
 def todos
  customer.todos
 end

end
