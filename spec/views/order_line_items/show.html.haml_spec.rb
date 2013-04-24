require 'spec_helper'

describe "order_line_items/show" do
  before(:each) do
    @order_line_item = assign(:order_line_item, stub_model(OrderLineItem,
      :quantity => 1,
      :price => 2,
      :subtotal => 3,
      :order_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
