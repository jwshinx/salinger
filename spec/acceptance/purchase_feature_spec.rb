require 'acceptance/acceptance_helper'

feature 'Purchase feature', %q{
  In order to manage purchases
  As an authenticated user 
  I want to view and create purchases 
} do

  before(:each) do
    @user = create_admin_user
    @status = OrderStatus.create({title: "Complete", description: "All done.", 
     updated_by: @user.id, created_by: @user.id})
    @fabric = Fabric.create({name: 'Black', updated_by: @user.id, created_by: @user.id})
    @product = Product.new({name: 'Raiders', description: 'blah', price: 5000, count: 10, 
     created_by: @user.id, updated_by: @user.id})
    @product.sewings.new({fabric_id:@fabric.id, updated_by: @user.id, created_by: @user.id})
    @product.save
    @mark= FactoryGirl.create(:mark_twain) 
    AddressType.create({name: "Shipping", description: "s blah", created_by: @user.id, updated_by:@user.id}) 
    @order = Order.new({purchase_date: "2013-01-23", paid_date: nil, customer_id: @mark.id, 
     purchase_amount: 8950, paid_amount: 3000, updated_by: @user.id, created_by: @user.id, 
     ispaid: false, order_status_id: @status.id})
    @order.line_items.new({quantity: 2, price: 4475, subtotal: 8950, product_id: @product.id, 
     updated_by: @user.id, created_by: @user.id})
    @order.save
  end

  scenario 'adding an order' do
    log_in
    visit "/new_purchase"
    fill_in 'firstname', :with => 'Jimmy'
    fill_in 'lastname', :with => 'Carter'
    fill_in 'email', :with => 'jc@yahoo.com'
    select 'Shipping', :from => 'address_type'
    fill_in 'address_name', :with => 'Home'
    fill_in 'address_line_one', :with => '1 Main Street'
    fill_in 'address_suite', :with => '101'
    fill_in 'address_city', :with => 'LA'
    select 'California', :from => 'address_state'
    fill_in 'address_zip', :with => '90011'
    select 'Complete', :from => 'order_status'
    fill_in 'purchase_date_datepicker', :with => '07/05/2013'
    select 'Raiders - $50.00', :from => 'customer_orders_attributes_0_line_items_attributes_0_product_id'
    fill_in 'paid_amount', :with => '20'
    click_button 'Save'
    should_be_on "/customers/#{Customer.find_by_email('jc@yahoo.com').id}"
    page.should have_content("Jimmy Carter")
    page.should have_content("Order was successfully created.")
  end
  scenario 'viewing order' do
    log_in
    visit "/orders"
    page.should have_content("Mark Twain")
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
