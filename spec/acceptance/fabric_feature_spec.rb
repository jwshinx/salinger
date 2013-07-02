require 'acceptance/acceptance_helper'

feature 'Fabric feature', %q{
  In order to manage fabrics 
  As an authenticated user 
  I want to list, create, update, destroy fabrics
} do

  before(:each) do
    @user = create_admin_user
    Fabric.create({name: 'Black', created_by: @user.id, updated_by: @user.id})
  end

  scenario 'listing fabrics' do
    log_in
    visit "/fabrics"
    page.should have_content("Fabrics")
    page.should have_content("Black")
  end
  scenario 'adding a fabric' do
    log_in
    visit "/fabrics/new"
    fill_in "fabric[name]", :with => "Polka Dots"
    fill_in "new_price_date_datepicker", :with => '10/10/2013'
    fill_in "fabric_prices_attributes_0_amount", :with => '2'
    click_button "Save"
    should_be_on "/fabrics/#{Fabric.find_by_name('Polka Dots').id}"
    page.should have_content("Polka Dots")
    page.should have_content("$2.00")
    page.should have_content("10/10/2013")
  end
  scenario 'editing a fabric' do
    log_in
    visit "/fabrics/#{Fabric.first.id}/edit"
    fill_in "fabric[name]", :with => "Negro"
    click_button "Save"
    should_be_on "/fabrics/#{Fabric.first.id}"
    page.should have_content("Negro")
  end
  scenario 'editing an existing fabric price' do
    Fabric.first.prices.create({amount:100, date:Date.today, updated_by: @user.id, created_by: @user.id})
    log_in
    visit "/fabrics/#{Fabric.first.id}/edit"
    fill_in "fabric[prices_attributes][0][amount]", :with => "1.25"
    click_button "Save"
    should_be_on "/fabrics/#{Fabric.first.id}"
    page.should have_content("1.25")
  end
  scenario 'adding a new fabric price' do
    Fabric.first.prices.create({amount:100, date:Date.today, updated_by: @user.id, created_by: @user.id})
    log_in
    visit "/fabrics/#{Fabric.first.id}/edit"
    fill_in "fabric[prices_attributes][1][amount]", :with => "1.50"
    fill_in "fabric[prices_attributes][1][date]", :with => "10/10/2013"
    click_button "Save"
    should_be_on "/fabrics/#{Fabric.first.id}"
    page.should have_content("1.00")
    page.should have_content("1.50")
  end
  scenario 'removing a fabric' do
    log_in
    visit "/fabrics"
    click_link "Destroy"
    should_be_on "/fabrics"
    page.has_no_content?("Black").should be true
  end
  scenario 'fabric name cannot be blank' do
    log_in
    visit "/fabrics/#{Fabric.first.id}/edit"
    fill_in "fabric[name]", :with => ""
    click_button "Save"
    page.should have_content("Name can't be blank")
  end
  scenario 'fabric name must be unique' do
    log_in
    visit "/fabrics/new"
    fill_in "fabric[name]", :with => "Black"
    fill_in "new_price_date_datepicker", :with => '10/10/2013'
    fill_in "fabric_prices_attributes_0_amount", :with => '2'
    click_button "Save"
    page.should have_content("Name has already been taken")
  end
  scenario 'only authenticated user can manage fabrics' do
    log_in
    log_out
    visit "/fabrics"
    should_be_on "/login"
    page.should have_content("You are not authorized to access this page") 
  end
end
