require 'trackable'
require 'formatable'

class Purchase
 include Trackable
 include Formatable

 attr_accessor :customer

 def initialize options, current_user
  @customer = Customer.new options[:customer]
  set_creator_and_updater @customer, current_user
  @customer.fyis.each { |f| set_creator_and_updater f, current_user }
  @customer.todos.each { |t| set_creator_and_updater t, current_user }
  @customer.addresses.each { |a| set_creator_and_updater a, current_user }
  Rails.logger.debug "---> Purchase.init 1: #{@customer.orders.inspect}" unless @customer.orders.empty?
  Rails.logger.debug "---> Purchase.init 2: #{@customer.orders.first.new_record?}" unless @customer.orders.empty?
  @customer.orders.each do |o|
   if o.new_record?
    Rails.logger.debug "---> Purchase.init 3: yes, its a new order"
    o.fyis.each { |ofyi| set_creator_and_updater ofyi, current_user }
    o.paid_amount = convert_dollars_to_cents( options[:customer][:orders_attributes]['0'][:paid_amount] )
    order_total = 0
    set_creator_and_updater o, current_user
    o.line_items.each_with_index do |oli, i|
     set_creator_and_updater oli, current_user
     price = Product.find(options[:customer][:orders_attributes]['0'][:line_items_attributes]['0'][:product_id]).price
     oli.price = price
     quantity = options[:customer][:orders_attributes]['0'][:line_items_attributes]['0'][:quantity].to_i
     order_total += price * quantity
     oli.subtotal = price * quantity
    end
    o.purchase_amount = apply_discount(order_total, options[:discount])
    o.purchase_date = Date.strptime(
     options[:customer][:orders_attributes]['0'][:purchase_date], '%m/%d/%Y'
    )
    o.paid_date = Date.strptime(
     options[:customer][:orders_attributes]['0'][:paid_date], '%m/%d/%Y'
    ) unless options[:customer][:orders_attributes]['0'][:line_items_attributes]['0'][:paid_date].blank?
   end
  end
  #@customer.save
 end

 def apply_discount(total, dollars)
   return total if dollars.blank?
   total - convert_dollars_to_cents(dollars)
 end
 def save
  customer.save
 end
 def to_s
  'purchase'
 end
 def todos
  customer.todos
 end

end
