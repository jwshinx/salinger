require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :title => "MyString",
      :description => "MyText",
      :updated_by => 1,
      :created_by => 1,
      :completed_by => 1,
      :assigned_to => 1,
      :task_status_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_title[name=?]", "task[title]"
      assert_select "textarea#task_description[name=?]", "task[description]"
      assert_select "input#task_updated_by[name=?]", "task[updated_by]"
      assert_select "input#task_created_by[name=?]", "task[created_by]"
      assert_select "input#task_completed_by[name=?]", "task[completed_by]"
      assert_select "input#task_assigned_to[name=?]", "task[assigned_to]"
      assert_select "input#task_task_status_id[name=?]", "task[task_status_id]"
    end
  end
end
