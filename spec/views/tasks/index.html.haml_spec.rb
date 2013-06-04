require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :title => "Title",
        :description => "MyText",
        :updated_by => 1,
        :created_by => 2,
        :completed_by => 3,
        :assigned_to => 4,
        :task_status_id => 5
      ),
      stub_model(Task,
        :title => "Title",
        :description => "MyText",
        :updated_by => 1,
        :created_by => 2,
        :completed_by => 3,
        :assigned_to => 4,
        :task_status_id => 5
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
