require 'acceptance/acceptance_helper'

feature 'Fabric feature', %q{
  In order to manage fabrics 
  As an authenticated user 
  I want to list, create, update, destroy devices
} do

  before(:each) do
    user = create_admin_user
    Fabric.create({name: 'Black', created_by: user.id, updated_by: user.id})
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
  scenario 'removing a fabric' do
    log_in
    visit "/fabrics"
    click_link "Destroy"
    should_be_on "/fabrics"
    page.has_no_content?("Black").should be true
  end
  scenario 'fabric name can not be blank' do
    log_in
    visit "/fabrics/#{Fabric.first.id}/edit"
    fill_in "fabric[name]", :with => ""
    click_button "Save"
    page.should have_content("Name can't be blank")
  end
  scenario 'fabric must be unique' do
    # rememeber that when adding, it redirects to show page
    log_in
    visit "/fabrics/new"
    fill_in "fabric[name]", :with => "Black"
    fill_in "new_price_date_datepicker", :with => '10/10/2013'
    fill_in "fabric_prices_attributes_0_amount", :with => '2'
    click_button "Save"
    page.should have_content("Fabric already exists")
  end
end
