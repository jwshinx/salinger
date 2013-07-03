require 'trackable'

class Purchase
 include Trackable

 attr_accessor :customer

 def initialize options, current_user
  @customer = Customer.new options[:customer]
  set_creator_and_updater @customer, current_user
  @customer.fyis.each { |f| set_creator_and_updater f, current_user }
  @customer.todos.each { |t| set_creator_and_updater t, current_user }
  @customer.addresses.each { |a| set_creator_and_updater a, current_user }
  @customer.orders.each do |o|
   order_total = 0
   set_creator_and_updater o, current_user
   o.line_items.each do |oli|
    set_creator_and_updater oli, current_user
    price = Product.find(options[:customer][:orders_attributes]['0'][:line_items_attributes]['0'][:product_id]).price
    oli.price = price
    quantity = options[:customer][:orders_attributes]['0'][:line_items_attributes]['0'][:quantity].to_i
    order_total += price * quantity
    oli.subtotal = price * quantity
   end
   o.purchase_amount = order_total
  end
  @customer.save
 end

 def to_s
  'purchase'
 end
 def todos
  @customer.todos
 end

end
