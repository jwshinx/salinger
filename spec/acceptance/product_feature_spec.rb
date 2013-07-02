require 'acceptance/acceptance_helper'

feature 'product feature', %q{
  In order to manage products
  As an authenticated user 
  I want to list, create, update, destroy products 
} do

  before(:each) do
    @user = create_admin_user
    @fabric = Fabric.create({name: 'Black', updated_by: @user.id, created_by: @user.id})
    #@redfabric = Fabric.create({name: 'Red', updated_by: @user.id, created_by: @user.id})
    @product = Product.new({name: 'Jimmyz', description: 'blah', price: 5000, count: 10, created_by: @user.id, updated_by: @user.id})
    @product.sewings.new({fabric_id:@fabric.id, updated_by: @user.id, created_by: @user.id})
    #@product.sewings.new({fabric_id:@redfabric.id, updated_by: @user.id, created_by: @user.id})
    @product.save
  end

  scenario 'listing products' do
    log_in
    visit "/products"
    page.should have_content("Jimmyz")
    page.should have_content("blah")
  end
  scenario 'showing a product' do
    log_in
    visit "/products/#{Product.first.id}"
    page.should have_content("Jimmyz")
    page.should have_content("blah")
  end
  scenario 'adding a product' do
    log_in
    visit "/products/new"
    fill_in "name", :with => "Gap"
    fill_in "description", :with => "just white"
    fill_in "count", :with => "5"   
    fill_in "price", :with => "44.44"        
    select 'Black', :from => 'product[sewings_attributes][0][fabric_id]'
    click_button "Save"
    should_be_on "/products/#{Product.find_by_name('Gap').id}"
    page.should have_content("Gap")
    page.should have_content("just white")
    page.should have_content("5")
    page.should have_content("44.44")
    page.should have_content("Black")        
  end
  scenario 'editing a product' do
    @redfabric = Fabric.create({name: 'Red', updated_by: @user.id, created_by: @user.id})
    @product.sewings.new({fabric_id:@redfabric.id, updated_by: @user.id, created_by: @user.id})
    log_in
    visit "/products/#{Product.first.id}/edit"
    fill_in "name", :with => "Jimmyz Surf"
    fill_in "description", :with => "Gaa"
    fill_in "count", :with => "11"  
    select 'Red', :from => 'product[sewings_attributes][0][fabric_id]' 
    click_button "Save"
    should_be_on "/products/#{Product.first.id}"
    page.should have_content("Jimmyz Surf")
    page.should have_content("11")
    page.should have_content("Gaa")
    page.should have_content("Red")
    page.has_no_content?("Black").should be true
  end
  scenario 'removing a product' do
    log_in
    visit "/products"
    click_link "Destroy"
    should_be_on "/products"
    page.has_no_content?("Jimmyz").should be true
  end
  scenario 'product name cannot be blank' do
    log_in
    visit "/products/#{Product.first.id}/edit"
    fill_in "name", :with => ""
    click_button "Save"
    page.should have_content("Name can't be blank")
  end
  scenario 'product price cannot be blank' do
    log_in
    visit "/products/#{Product.first.id}/edit"
    fill_in "price", :with => ""
    click_button "Save"
    page.should have_content("Price must be greater than 0")
  end
  scenario 'product count cannot be blank' do
    log_in
    visit "/products/#{Product.first.id}/edit"
    fill_in "count", :with => ""
    click_button "Save"
    page.should have_content("Count can't be blank")
  end
  scenario 'product fabric cannot be blank' do
    log_in
    visit "/products/#{Product.first.id}/edit"
    check('product_sewings_attributes_0__destroy')
    click_button "Save"
    page.should have_content("Product must be made of at least one fabric")
  end
  scenario 'only authenticated user can manage product statuses' do
    log_in
    log_out
    visit "/products"
    should_be_on "/login"
    page.should have_content("You are not authorized to access this page") 
  end
end
