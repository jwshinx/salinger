require 'spec_helper'

describe "order_statuses/new" do
  before(:each) do
    assign(:order_status, stub_model(OrderStatus,
      :title => "MyString",
      :description => "MyText",
      :updated_by => 1,
      :created_by => 1
    ).as_new_record)
  end

  it "renders new order_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_statuses_path, "post" do
      assert_select "input#order_status_title[name=?]", "order_status[title]"
      assert_select "textarea#order_status_description[name=?]", "order_status[description]"
      assert_select "input#order_status_updated_by[name=?]", "order_status[updated_by]"
      assert_select "input#order_status_created_by[name=?]", "order_status[created_by]"
    end
  end
end
