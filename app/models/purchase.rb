class Purchase
 include Trackable
 include Formatable     
 include Exceptions

 attr_accessor :customer, :order, :current_user
                                                                     
 def initialize options, current_user
  @customer = Customer.new options[:customer]
  @order = @customer.orders.last
  @order_total = 0                                    
  @current_user = current_user
  set_creator_and_updater @customer, current_user
  set_creator_and_updater_to_customer_children @customer, current_user
  process_order options, current_user
 end                      
 
 def process_order options, current_user
   check_for_adequate_inventory 
   @order.fyis.each { |ofyi| set_creator_and_updater ofyi, current_user }
   @order.paid_amount = convert_dollars_to_cents( options[:customer][:orders_attributes]['0'][:paid_amount] )
   set_creator_and_updater @order, current_user   
   @order_total = @order.process_subtotals_of_line_items( options, current_user, @order_total )        
   @order.purchase_amount = apply_discount(@order_total, options[:discount], current_user)
   raise Exceptions::ExcessiveDiscountAmount if @order.purchase_amount < 0                                     
   @order.purchase_date = mmddyy_format(options[:customer][:orders_attributes]['0'][:purchase_date])
   @order.paid_date = mmddyy_format(options[:customer][:orders_attributes]['0'][:paid_date]) unless options[:customer][:orders_attributes]['0'][:paid_date].blank?                                       
 end                     
 def check_for_adequate_inventory
   @order.line_items.each { |li| raise Exceptions::InadequateInventory if li.quantity > li.product.count }
 end 
          
 def apply_discount(total, dollars, current_user)    
   return total if dollars.blank?       
   cents_discount = convert_dollars_to_cents(dollars)
   set_creator_and_updater(@order.fyis.build({content: "Discount of $#{dollars} applied."}), current_user) if cents_discount > 0 
   total - cents_discount
 end
 def save
  ActiveRecord::Base.transaction do
   customer.save!
   @order.reduce_inventory
  end
 end
 def to_s
  'purchase'
 end
 def todos
  customer.todos
 end
 def self.define_creator_and_updater_setter_for_children *children_list  
  define_method "set_creator_and_updater_to_customer_children" do |parent, current_user|
   children_list.each do |children| 
    eval "@#{parent.class.to_s.downcase}.#{children}.each { |child| set_creator_and_updater(child, current_user)}"
   end
  end
 end     
  
 define_creator_and_updater_setter_for_children('fyis', 'todos', 'addresses')      

end
