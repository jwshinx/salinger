require 'acceptance/acceptance_helper'

feature 'Task feature', %q{
  In order to manage tasks
  As an authenticated user 
  I want to list, create, update, destroy tasks 
} do

  before(:each) do
    @user = create_admin_user
    @pending = TaskStatusType.create({name: 'Pending', description: 'blah', created_by: @user.id, updated_by: @user.id})
    @pending.tasks.create({title: 'Do homework', description: 'blah', created_by: @user.id, updated_by: @user.id})
  end

  scenario 'listing tasks' do
    log_in
    visit "/tasks"
    page.should have_content("Do homework")
    page.should have_content("blah")
  end
  scenario 'showing a task status type' do
    log_in
    visit "/tasks/#{Task.first.id}"
    page.should have_content("Do homework")
    page.should have_content("blah")
  end
  scenario 'adding a tasks ' do
    log_in
    visit "/tasks/new"
    fill_in "task[title]", :with => "Do dishes"
    fill_in "task[description]", :with => "kitchen stuff"
    select 'Pending', :from => 'task_status'
    click_button "Save"
    should_be_on "/tasks/#{Task.find_by_title('Do dishes').id}"
    page.should have_content("Do dishes")
    page.should have_content("kitchen stuff")
  end
  scenario 'editing a task' do
    with_versioning do
      log_in
      visit "/tasks/#{Task.first.id}/edit"
      fill_in "task[title]", :with => "Do dirty dishes"
      fill_in "task[description]", :with => "Gaa"
      select 'Pending', :from => 'task_status'
      click_button "Save"
      should_be_on "/tasks/#{Task.first.id}"
      page.should have_content("Do dirty dishes")
      page.should have_content("Gaa")
    end   
  end
  scenario 'removing a task' do
    log_in
    visit "/tasks"
    click_link "Destroy"
    should_be_on "/tasks"
    page.has_no_content?("Do homework").should be true
  end
  scenario 'task title cannot be blank' do
    log_in
    visit "/tasks/#{Task.first.id}/edit"
    fill_in "task[title]", :with => ""
    click_button "Save"
    page.should have_content("Title can't be blank")
  end
  scenario 'only authenticated user can manage task statuses' do
    log_in
    log_out
    visit "/tasks"
    should_be_on "/login"
    page.should have_content("You are not authorized to access this page") 
  end
end
