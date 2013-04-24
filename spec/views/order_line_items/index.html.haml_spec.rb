require 'spec_helper'

describe "order_line_items/index" do
  before(:each) do
    assign(:order_line_items, [
      stub_model(OrderLineItem,
        :quantity => 1,
        :price => 2,
        :subtotal => 3,
        :order_id => 4
      ),
      stub_model(OrderLineItem,
        :quantity => 1,
        :price => 2,
        :subtotal => 3,
        :order_id => 4
      )
    ])
  end

  it "renders a list of order_line_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
