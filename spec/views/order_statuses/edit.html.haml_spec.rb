require 'spec_helper'

describe "order_statuses/edit" do
  before(:each) do
    @order_status = assign(:order_status, stub_model(OrderStatus,
      :title => "MyString",
      :description => "MyText",
      :updated_by => 1,
      :created_by => 1
    ))
  end

  it "renders the edit order_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_status_path(@order_status), "post" do
      assert_select "input#order_status_title[name=?]", "order_status[title]"
      assert_select "textarea#order_status_description[name=?]", "order_status[description]"
      assert_select "input#order_status_updated_by[name=?]", "order_status[updated_by]"
      assert_select "input#order_status_created_by[name=?]", "order_status[created_by]"
    end
  end
end
