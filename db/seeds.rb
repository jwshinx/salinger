# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def delete_all_roles
 Role.delete_all
end
def create_all_roles
 delete_all_roles
 Role.create({name: 'admin', description: 'only joel'})
 Role.create({name: 'manager', description: 'only paola and monique'})
end
def delete_all_users
 User.delete_all
end
def create_all_users
 delete_all_users
 admin = Role.find_by_name 'admin'
 manager = Role.find_by_name 'manager'
 User.create({username: 'joel', email: 'joel@unidoinoakland.com', 
  active: true, role_id: admin.id, password: 'password', password_confirmation: 'password'})
 User.create({username: 'paola', email: 'paola@unidoinoakland.com', 
  active: true, role_id: manager.id, password: 'password', password_confirmation: 'password'})
 User.create({username: 'monique', email: 'monique@unidoinoakland.com', 
  active: true, role_id: manager.id, password: 'password', password_confirmation: 'password'})
end
def define_joel
 @joel = User.find_by_username 'joel'
end
def delete_all_fabrics
 Fabric.delete_all
end
def create_all_fabrics
 delete_all_fabrics
 Fabric.create({name: 'Orange', created_by: @joel.id, updated_by: @joel.id})
 Fabric.create({name: 'Black', created_by: @joel.id, updated_by: @joel.id})
 Fabric.create({name: 'Yellow', created_by: @joel.id, updated_by: @joel.id})
 Fabric.create({name: 'Green', created_by: @joel.id, updated_by: @joel.id})
 Fabric.create({name: 'Red', created_by: @joel.id, updated_by: @joel.id})
end
def delete_all_farms_and_retailers
 Address.delete_all
 Farm.delete_all
 Retailer.delete_all
end
def create_all_farms_and_retailers
 delete_all_farms_and_retailers
 a1 = Address.create({street: '1 First Street', suite: '#101', city: 'Oakland', state: 'CA', 
  zip: '94610', created_by: @joel.id, updated_by: @joel.id})
 a2 = Address.create({street: '2 Second Street', suite: '#200', city: 'Oakland', state: 'CA', 
  zip: '94615', created_by: @joel.id, updated_by: @joel.id})
 a3 = Address.create({street: '1000 Shattuck Avenue', suite: '#1', city: 'Berkeley', state: 'CA', 
  zip: '94700', created_by: @joel.id, updated_by: @joel.id})
 a4 = Address.create({street: '20 College Avenue', suite: '#2', city: 'Berkeley', state: 'CA', 
  zip: '94705', created_by: @joel.id, updated_by: @joel.id})
 Farm.create({name: 'Joann', address_id: a1.id, contact: 'Joanne Smith', phone: '5109993333',
  created_by: @joel.id, updated_by: @joel.id})
 Farm.create({name: "Michael's", address_id: a2.id, contact: 'Michael Smith', phone: '5102221111',
  created_by: @joel.id, updated_by: @joel.id})
 Retailer.create({name: "Resurrect", address_id: a3.id, contact: 'Karrie Karrie', phone: '5108881111',
  created_by: @joel.id, updated_by: @joel.id})
 Retailer.create({name: "Nathan and Co", address_id: a4.id, contact: 'Tanya Lee', phone: '5107553333',
  created_by: @joel.id, updated_by: @joel.id})
end
def delete_all_customers
 Customer.delete_all
 Note.delete_all
end
def create_all_customers
 delete_all_customers
 @c1 = Customer.create({firstname:  'Brad', lastname: 'Pitt', email: 'bp@yahoo.com', description: 'paola friend',
  created_by: @joel.id, updated_by: @joel.id})
 @c2 = Customer.create({firstname:  'George', lastname: 'Clooney', email: 'gc@yahoo.com', description: 'mo friend',
  created_by: @joel.id, updated_by: @joel.id})
 @c1.fyis.create({content: 'his hair blonde', created_by: @joel.id, updated_by: @joel.id})
 @c2.fyis.create({content: 'hair brown', created_by: @joel.id, updated_by: @joel.id})
 @c1.todos.create({content: 'email receipt', created_by: @joel.id, updated_by: @joel.id})
 @c2.todos.create({content: 'send to lake como', created_by: @joel.id, updated_by: @joel.id})
end
def delete_all_products
 Product.delete_all
 Sewing.delete_all
end
def create_all_products
 delete_all_products
 @p1 = Product.create({name: 'Sunkist', description: 'bright and fun', price: 2500,
  count: 1, created_by: @joel.id, updated_by: @joel.id})
 @p2 = Product.create({name: "Oakland A's", description: 'lets go oakland', price: 5000,
  count: 1, created_by: @joel.id, updated_by: @joel.id})
 @p3 = Product.create({name: "SF Giants", description: 'sf pride', price: 5000,
  count: 1, created_by: @joel.id, updated_by: @joel.id})
 @p4 = Product.create({name: "Black and White Ball", description: 'clean and simple', price: 2500,
  count: 1, created_by: @joel.id, updated_by: @joel.id})
 o_fab = Fabric.find_by_name 'Orange'
 y_fab = Fabric.find_by_name 'Yellow'
 g_fab = Fabric.find_by_name 'Green'
 b_fab = Fabric.find_by_name 'Black'
 @p1.sewings.create({fabric_id: o_fab.id, created_by: @joel.id, updated_by: @joel.id})
 @p2.sewings.create({fabric_id: y_fab.id, created_by: @joel.id, updated_by: @joel.id})
 @p2.sewings.create({fabric_id: g_fab.id, created_by: @joel.id, updated_by: @joel.id})
 @p3.sewings.create({fabric_id: o_fab.id, created_by: @joel.id, updated_by: @joel.id})
 @p3.sewings.create({fabric_id: b_fab.id, created_by: @joel.id, updated_by: @joel.id})
 @p4.sewings.create({fabric_id: b_fab.id, created_by: @joel.id, updated_by: @joel.id})
end
def delete_all_orders
 Order.delete_all
 OrderLineItem.delete_all
end
def delete_all_emails
 Email.delete_all
end
def delete_all_email_types
 EmailType.delete_all
end
def create_all_emails
 delete_all_emails
 delete_all_email_types
 et = EmailType.create( {name: 'Email Signup', description: 'dkdkd', updated_by: @joel.id, created_by: @joel.id})
 Email.create( {content: 'maybe@yahoo.com', email_type_id: et.id, updated_by: @joel.id, created_by: @joel.id})
end
def create_all_orders
 delete_all_orders
 qty_ten = 10
 o1 = @c1.orders.create({purchase_date: Date.today, purchase_amount: qty_ten * @p2.price, 
  created_by: @joel.id, updated_by: @joel.id})
 o1.line_items.create({quantity: qty_ten, product_id: @p2.id, price: @p2.price, subtotal: @p2.price * qty_ten,
  created_by: @joel.id, updated_by: @joel.id})
   
 o2 = @c1.orders.create({purchase_date: Date.today, purchase_amount: qty_ten * @p4.price, 
  created_by: @joel.id, updated_by: @joel.id})
 o2.line_items.create({quantity: qty_ten, product_id: @p4.id, price: @p4.price, subtotal: @p4.price * qty_ten,
  created_by: @joel.id, updated_by: @joel.id})

 total = (@p4.price + @p3.price) * qty_ten
 o3 = @c2.orders.create({purchase_date: Date.today, purchase_amount: total, 
  created_by: @joel.id, updated_by: @joel.id})
 o3.line_items.create({quantity: qty_ten, product_id: @p4.id, price: @p4.price, subtotal: @p4.price * qty_ten,
  created_by: @joel.id, updated_by: @joel.id})
 o3.line_items.create({quantity: qty_ten, product_id: @p3.id, price: @p3.price, subtotal: @p3.price * qty_ten,
  created_by: @joel.id, updated_by: @joel.id})

end

puts "---> hi. im seed.rb. lets start"

create_all_roles
puts "---> roles: done" 
create_all_users
puts "---> users: done" 
define_joel
puts "---> joel: done" 
create_all_fabrics
puts "---> fabrics: done" 
create_all_farms_and_retailers
puts "---> farms, retailers: done" 
create_all_customers
puts "---> customers: done" 
create_all_products
puts "---> products: done" 
create_all_orders
puts "---> orders: done" 
create_all_emails
puts "---> emails: done" 

puts "---> all done."
#Fabric.delete_all
#Fabric.create(name: "camouflage,gray and black stripes- jersey? uNido or Pao's")
#Fabric.create(name: "green for nathan ,turquoise jersey- uNido or Pao's")
#Fabric.create(name: "yellow")
#Fabric.create(name: "orange")
#Fabric.create(name: "blue with flowers for nathan ")
#Fabric.create(name: "gray speckles")
#Fabric.create(name: "sage with holes")
#Fabric.create(name: "navy blue light knit")
#Fabric.create(name: "slinky stripes for nathan")
#Fabric.create(name: "white beater stripes- red")
#Fabric.create(name: "gray argyle")
#Fabric.create(name: "bird wool")
#Fabric.create(name: "black and white birds")
#Fabric.create(name: "black and white swirls")
#Fabric.create(name: "traditional plaid flannel")
#Fabric.create(name: "army green and black light knit")
#Fabric.create(name: "thick striped colores- light jersey")
