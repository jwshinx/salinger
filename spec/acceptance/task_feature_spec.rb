require 'acceptance/acceptance_helper'

feature 'Task feature', %q{
  In order to manage tasks 
  As an authenticated user 
  I want to list, create, update, destroy tasks
} do

  before(:each) do
    @user = create_admin_user
    Task.create({name: 'Black', created_by: @user.id, updated_by: @user.id})
  end

  scenario 'listing tasks' do
    log_in
    visit "/tasks"
    page.should have_content("Tasks")
    page.should have_content("Black")
  end
  scenario 'adding a task' do
    log_in
    visit "/tasks/new"
    fill_in "task[name]", :with => "Polka Dots"
    fill_in "new_price_date_datepicker", :with => '02/13/2013'
    fill_in "task_prices_attributes_0_amount", :with => '2'
    click_button "Save"
    should_be_on "/tasks/#{Task.find_by_name('Polka Dots').id}"
    page.should have_content("Polka Dots")
    page.should have_content("$2.00")
    page.should have_content("02/13/2013")
  end
  scenario 'editing a task' do
    log_in
    visit "/tasks/#{Task.first.id}/edit"
    fill_in "task[name]", :with => "Negro"
    click_button "Save"
    should_be_on "/tasks/#{Task.first.id}"
    page.should have_content("Negro")
  end
  scenario 'editing an existing task price' do
    Task.first.prices.create({amount:100, date:Date.today, updated_by: @user.id, created_by: @user.id})
    log_in
    visit "/tasks/#{Task.first.id}/edit"
    fill_in "task[prices_attributes][0][amount]", :with => "1.25"
    click_button "Save"
    should_be_on "/tasks/#{Task.first.id}"
    page.should have_content("1.25")
  end
  scenario 'adding a new task price' do
    Task.first.prices.create({amount:100, date:Date.today, updated_by: @user.id, created_by: @user.id})
    log_in
    visit "/tasks/#{Task.first.id}/edit"
    fill_in "task[prices_attributes][1][amount]", :with => "1.50"
    fill_in "task[prices_attributes][1][date]", :with => "02/14/2013"
    click_button "Save"
    should_be_on "/tasks/#{Task.first.id}"
    page.should have_content("1.00")
    page.should have_content("02/14/2013")
    page.should have_content("1.50")
  end
  scenario 'removing a task' do
    log_in
    visit "/tasks"
    click_link "Destroy"
    should_be_on "/tasks"
    page.has_no_content?("Black").should be true
  end
  scenario 'task name cannot be blank' do
    log_in
    visit "/tasks/#{Task.first.id}/edit"
    fill_in "task[name]", :with => ""
    click_button "Save"
    page.should have_content("Name can't be blank")
  end
  scenario 'task name must be unique' do
    log_in
    visit "/tasks/new"
    fill_in "task[name]", :with => "Black"
    fill_in "new_price_date_datepicker", :with => '02/15/2013'
    fill_in "task_prices_attributes_0_amount", :with => '2'
    click_button "Save"
    page.should have_content("Name has already been taken")
  end
  scenario 'only authenticated user can manage tasks' do
    log_in
    log_out
    visit "/tasks"
    should_be_on "/login"
    page.should have_content("You are not authorized to access this page") 
  end
end
