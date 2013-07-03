require 'acceptance/acceptance_helper'

feature 'purchase feature', %q{
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
    @order = Order.new({purchase_date: "2013-01-23", paid_date: nil, customer_id: @mark.id, 
     purchase_amount: 8950, paid_amount: 3000, updated_by: @user.id, created_by: @user.id, 
     ispaid: false, order_status_id: @status.id})
    @order.line_items.new({quantity: 2, price: 4475, subtotal: 8950, product_id: @product.id, 
     updated_by: @user.id, created_by: @user.id})
    @order.save
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
