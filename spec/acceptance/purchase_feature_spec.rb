require 'acceptance/acceptance_helper'

feature 'Purchase feature', %q{
  In order to manage purchases
  As an authenticated user 
  I want to view and create purchases 
} do

  before(:each) do
    @user = create_admin_user
    @status = FactoryGirl.create(:completed_order)
    #@mark= FactoryGirl.create(:mark_twain, username: "mt#{random_string}", email: "mt#{random_string}@yahoo.com") 
    @mark= FactoryGirl.create(:charles_dickens, email: "cd#{random_string}@yahoo.com") 
    FactoryGirl.create(:address_type)
    @fabric = FactoryGirl.create(:white_cotton)
    @product = Product.new({name: 'Raiders', description: 'blah', price: 5000, count: 10, 
     created_by: 22, updated_by: 22})
    @product.sewings.new({fabric_id:@fabric.id, updated_by: 22, created_by: 22})
    @product.save
    @order = Order.new({purchase_date: "2013-01-23", paid_date: nil, customer_id: @mark.id, 
     purchase_amount: 8950, paid_amount: 3000, updated_by: 22, created_by: 22, 
     ispaid: false, order_status_id: @status.id})
    @order.line_items.new({quantity: 2, price: 4475, subtotal: 8950, product_id: @product.id, 
     updated_by: 22, created_by: 22})
    @order.save
  end
 
  scenario "throws error when creating an order with non-unique customer name" do
    log_in
    visit "/new_purchase"                                                                        
    Customer.count.should == 1
    Product.first.count.should == 10    
    Order.count.should == 1
    OrderLineItem.count.should == 1      
    Note.count.should == 0
    fill_in 'firstname', :with => 'Charles'
    fill_in 'lastname', :with => 'Dickens'
    fill_in 'email', :with => 'cd@dyydyd.com'
    select 'Shipping', :from => 'address_type'
    fill_in 'address_name', :with => 'Home'
    fill_in 'address_line_one', :with => '1 Main Street'
    fill_in 'address_suite', :with => '101'
    fill_in 'address_city', :with => 'LA'
    select 'California', :from => 'address_state'
    fill_in 'address_zip', :with => '90011'
    select 'Complete', :from => 'order_status'
    fill_in 'discount', :with => '9.99'
    fill_in 'purchase_date_datepicker', :with => '07/05/2013'
    select 'Raiders - $50.00', :from => 'customer_orders_attributes_0_line_items_attributes_0_product_id'
    fill_in 'customer_orders_attributes_0_line_items_attributes_0_quantity', :with => '10'
    fill_in 'paid_amount', :with => '20'
    click_button 'Save'                      
    page.should have_content("Firstname/lastname combination already exists. Send information to jwshin@gmail.com.")
    Customer.count.should == 1
    Product.first.count.should == 10    
    Order.count.should == 1
    OrderLineItem.count.should == 1        
    Order.first.created_by.should == 22
    Order.first.updated_by.should == 22
    OrderLineItem.first.created_by.should == 22
    OrderLineItem.first.updated_by.should == 22
    Note.count.should == 0
  end

  scenario "throws error when creating an order with quantity beyond inventory" do
    log_in
    visit "/new_purchase"     
    Customer.count.should == 1
    Product.first.count.should == 10    
    Order.count.should == 1
    OrderLineItem.count.should == 1
    Note.count.should == 0
    fill_in 'firstname', :with => 'Jimmy'
    fill_in 'lastname', :with => 'Carter'
    fill_in 'email', :with => 'jcarter@yahoo.com'
    select 'Shipping', :from => 'address_type'
    fill_in 'address_name', :with => 'Home'
    fill_in 'address_line_one', :with => '1 Main Street'
    fill_in 'address_suite', :with => '101'
    fill_in 'address_city', :with => 'LA'
    select 'California', :from => 'address_state'
    fill_in 'address_zip', :with => '90011'
    select 'Complete', :from => 'order_status'
    fill_in 'discount', :with => '9.99'
    fill_in 'purchase_date_datepicker', :with => '07/05/2013'
    select 'Raiders - $50.00', :from => 'customer_orders_attributes_0_line_items_attributes_0_product_id'
    fill_in 'customer_orders_attributes_0_line_items_attributes_0_quantity', :with => '11'
    fill_in 'paid_amount', :with => '20'
    click_button 'Save'                      
    page.should have_content("Inventory is inadequate. Please check product quantities.")    
    Customer.count.should == 1
    Product.first.count.should == 10    
    Order.count.should == 1
    OrderLineItem.count.should == 1    
    Order.first.created_by.should == 22
    Order.first.updated_by.should == 22
    OrderLineItem.first.created_by.should == 22
    OrderLineItem.first.updated_by.should == 22
    Note.count.should == 0
  end

  scenario "adding an order with a valid discount '9.99'" do
    log_in
    visit "/new_purchase"
    Product.first.count.should == 10    
    Customer.count.should == 1
    Order.count.should == 1
    OrderLineItem.count.should == 1        
    Order.first.created_by.should == 22
    Order.first.updated_by.should == 22
    OrderLineItem.first.created_by.should == 22
    OrderLineItem.first.updated_by.should == 22
    Note.count.should == 0
    fill_in 'firstname', :with => 'Jimmy'
    fill_in 'lastname', :with => 'Carter'
    fill_in 'email', :with => 'jcarter@yahoo.com'
    select 'Shipping', :from => 'address_type'
    fill_in 'address_name', :with => 'Home'
    fill_in 'address_line_one', :with => '1 Main Street'
    fill_in 'address_suite', :with => '101'
    fill_in 'address_city', :with => 'LA'
    select 'California', :from => 'address_state'
    fill_in 'address_zip', :with => '90011'
    select 'Complete', :from => 'order_status'
    fill_in 'discount', :with => '9.99'
    fill_in 'purchase_date_datepicker', :with => '07/05/2013'
    select 'Raiders - $50.00', :from => 'customer_orders_attributes_0_line_items_attributes_0_product_id'
    fill_in 'customer_orders_attributes_0_line_items_attributes_0_quantity', :with => '1'
    fill_in 'paid_amount', :with => '20'
    click_button 'Save'
    should_be_on "/customers/#{Customer.find_by_email('jcarter@yahoo.com').id}"
    page.should have_content("Jimmy Carter")
    page.should have_content("Order was successfully created.")
    page.should have_content("$40.01")
    page.should have_content("Discount of $9.99 applied.")
    Customer.count.should == 2
    Product.first.count.should == 9    
    Order.count.should == 2
    OrderLineItem.count.should == 2        
    Order.last.created_by.should == @user.id
    Order.last.updated_by.should == @user.id
    OrderLineItem.last.created_by.should == @user.id
    OrderLineItem.last.updated_by.should == @user.id    
    Note.count.should == 1
    Note.first.content.should == 'Discount of $9.99 applied.'    
  end

  scenario 'throws error when creating order with a discount value greater than the total' do
    log_in
    visit "/new_purchase"     
    Customer.count.should == 1                 
    Product.first.count.should == 10    
    Order.count.should == 1
    OrderLineItem.count.should == 1    
    Order.first.created_by.should == 22
    Order.first.updated_by.should == 22
    OrderLineItem.first.created_by.should == 22
    OrderLineItem.first.updated_by.should == 22
    Note.count.should == 0
    fill_in 'firstname', :with => 'Jimmy'
    fill_in 'lastname', :with => 'Carter'
    fill_in 'email', :with => 'jcarter@yahoo.com'
    select 'Shipping', :from => 'address_type'
    fill_in 'address_name', :with => 'Home'
    fill_in 'address_line_one', :with => '1 Main Street'
    fill_in 'address_suite', :with => '101'
    fill_in 'address_city', :with => 'LA'
    select 'California', :from => 'address_state'
    fill_in 'address_zip', :with => '90011'
    select 'Complete', :from => 'order_status'
    fill_in 'discount', :with => '59.99'
    fill_in 'purchase_date_datepicker', :with => '07/05/2013'
    select 'Raiders - $50.00', :from => 'customer_orders_attributes_0_line_items_attributes_0_product_id'
    fill_in 'customer_orders_attributes_0_line_items_attributes_0_quantity', :with => '1'
    fill_in 'paid_amount', :with => '20'
    click_button 'Save'
    page.should have_content("Discount cannot be more than the total order amount.")
    Customer.count.should == 1
    Product.first.count.should == 10    
    Order.count.should == 1
    OrderLineItem.count.should == 1    
    Order.first.created_by.should == 22
    Order.first.updated_by.should == 22
    OrderLineItem.first.created_by.should == 22
    OrderLineItem.first.updated_by.should == 22
    Note.count.should == 0
  end

  scenario "adding an order of ignored non-numeric discount value 'rrr'" do
    log_in
    visit "/new_purchase"
    Customer.count.should == 1                 
    Product.first.count.should == 10    
    Order.count.should == 1
    OrderLineItem.count.should == 1    
    Order.first.created_by.should == 22
    Order.first.updated_by.should == 22
    OrderLineItem.first.created_by.should == 22
    OrderLineItem.first.updated_by.should == 22
    Note.count.should == 0
    fill_in 'firstname', :with => 'Jimmy'
    fill_in 'lastname', :with => 'Carter'
    fill_in 'email', :with => 'jcarter@yahoo.com'
    select 'Shipping', :from => 'address_type'
    fill_in 'address_name', :with => 'Home'
    fill_in 'address_line_one', :with => '1 Main Street'
    fill_in 'address_suite', :with => '101'
    fill_in 'address_city', :with => 'LA'
    select 'California', :from => 'address_state'
    fill_in 'address_zip', :with => '90011'
    select 'Complete', :from => 'order_status'
    fill_in 'discount', :with => 'rrr'
    fill_in 'purchase_date_datepicker', :with => '07/05/2013'
    select 'Raiders - $50.00', :from => 'customer_orders_attributes_0_line_items_attributes_0_product_id'
    fill_in 'customer_orders_attributes_0_line_items_attributes_0_quantity', :with => '1'
    fill_in 'paid_amount', :with => '20'
    click_button 'Save'
    should_be_on "/customers/#{Customer.find_by_email('jcarter@yahoo.com').id}"
    page.should have_content("Jimmy Carter")
    page.should have_content("Order was successfully created.")
    page.should have_content("$50.00")         
    Customer.count.should == 2      
    Product.first.count.should == 9    
    Order.count.should == 2
    OrderLineItem.count.should == 2    
    Order.last.created_by.should_not == 22
    Order.last.updated_by.should_not == 22
    OrderLineItem.last.created_by.should_not == 22
    OrderLineItem.last.updated_by.should_not == 22
    Note.count.should == 0    
  end

  scenario "adding an order with a '0' discount" do
    log_in
    visit "/new_purchase"
    Customer.count.should == 1    
    Product.first.count.should == 10    
    Order.count.should == 1
    OrderLineItem.count.should == 1    
    Order.last.created_by.should == 22
    Order.last.updated_by.should == 22
    OrderLineItem.last.created_by.should == 22
    OrderLineItem.last.updated_by.should == 22
    Note.count.should == 0    
    fill_in 'firstname', :with => 'Jimmy'
    fill_in 'lastname', :with => 'Carter'
    fill_in 'email', :with => 'jcarter@yahoo.com'
    select 'Shipping', :from => 'address_type'
    fill_in 'address_name', :with => 'Home'
    fill_in 'address_line_one', :with => '1 Main Street'
    fill_in 'address_suite', :with => '101'
    fill_in 'address_city', :with => 'LA'
    select 'California', :from => 'address_state'
    fill_in 'address_zip', :with => '90011'
    select 'Complete', :from => 'order_status'
    fill_in 'discount', :with => '0'
    fill_in 'purchase_date_datepicker', :with => '07/05/2013'
    select 'Raiders - $50.00', :from => 'customer_orders_attributes_0_line_items_attributes_0_product_id'
    fill_in 'customer_orders_attributes_0_line_items_attributes_0_quantity', :with => '1'
    fill_in 'paid_amount', :with => '20'
    click_button 'Save'
    should_be_on "/customers/#{Customer.find_by_email('jcarter@yahoo.com').id}"
    page.should have_content("Jimmy Carter")
    page.should have_content("Order was successfully created.")
    Customer.count.should == 2      
    Product.first.count.should == 9    
    Order.count.should == 2
    OrderLineItem.count.should == 2    
    Order.last.created_by.should_not == 22
    Order.last.updated_by.should_not == 22
    OrderLineItem.last.created_by.should_not == 22
    OrderLineItem.last.updated_by.should_not == 22
    Note.count.should == 0    
  end

  scenario 'viewing order' do
    log_in
    visit "/orders"
    page.should have_content("Charles Dickens")
    page.should have_content("Complete")
    page.should have_content("89.50")
  end
  scenario 'only authenticated user can manage purchase' do
    log_in
    log_out
    visit "/orders"
    should_be_on "/login"
    page.should have_content("You are not authorized to access this page") 
  end
end
