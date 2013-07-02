require 'acceptance/acceptance_helper'

feature 'TaskStatusType status type feature', %q{
  In order to manage task statuses 
  As an authenticated user 
  I want to list, create, update, destroy task statuses
} do

  before(:each) do
    @user = create_admin_user
    TaskStatusType.create({name: 'Pending', description: 'blah', created_by: @user.id, updated_by: @user.id})
  end

  scenario 'listing task statuses' do
    log_in
    visit "/task_status_types"
    page.should have_content("Pending")
    page.should have_content("blah")
  end
  scenario 'showing a task status type' do
    log_in
    visit "/task_status_types/#{TaskStatusType.first.id}"
    page.should have_content("Pending")
    page.should have_content("blah")
  end
  scenario 'adding a task status type' do
    log_in
    visit "/task_status_types/new"
    fill_in "task_status_type_name", :with => "Asap"
    fill_in "task_status_type_description", :with => "Do now"
    click_button "Save"
    should_be_on "/task_status_types/#{TaskStatusType.find_by_name('Asap').id}"
    page.should have_content("Asap")
    page.should have_content("Do now")
  end
  scenario 'editing a task status type' do
    log_in
    visit "/task_status_types/#{TaskStatusType.first.id}/edit"
    fill_in "task_status_type_name", :with => "Not Complete"
    fill_in "task_status_type_description", :with => "Gaa"
    click_button "Save"
    should_be_on "/task_status_types/#{TaskStatusType.first.id}"
    page.should have_content("Not Complete")
    page.should have_content("Gaa")
  end
  scenario 'removing a task status type' do
    log_in
    visit "/task_status_types"
    click_link "Destroy"
    should_be_on "/task_status_types"
    page.has_no_content?("Pending").should be true
  end
  scenario 'task status type name cannot be blank' do
    log_in
    visit "/task_status_types/#{TaskStatusType.first.id}/edit"
    fill_in "task_status_type_name", :with => ""
    click_button "Save"
    page.should have_content("Name can't be blank")
  end
  scenario 'task status type name must be unique' do
    log_in
    visit "/task_status_types/new"
    fill_in "task_status_type_name", :with => "Pending"
    fill_in "task_status_type_description", :with => "xxx"
    click_button "Save"
    page.should have_content("Name has already been taken")
  end
  scenario 'only authenticated user can manage task statuses' do
    log_in
    log_out
    visit "/task_status_types"
    should_be_on "/login"
    page.should have_content("You are not authorized to access this page") 
  end
end
