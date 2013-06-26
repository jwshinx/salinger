require 'spec_helper'

describe "order_statuses/index" do
  before(:each) do
    assign(:order_statuses, [
      stub_model(OrderStatus,
        :title => "Title",
        :description => "MyText",
        :updated_by => 1,
        :created_by => 2
      ),
      stub_model(OrderStatus,
        :title => "Title",
        :description => "MyText",
        :updated_by => 1,
        :created_by => 2
      )
    ])
  end

  it "renders a list of order_statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
