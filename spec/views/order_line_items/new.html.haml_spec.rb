require 'spec_helper'

describe "order_line_items/new" do
  before(:each) do
    assign(:order_line_item, stub_model(OrderLineItem,
      :quantity => 1,
      :price => 1,
      :subtotal => 1,
      :order_id => 1
    ).as_new_record)
  end

  it "renders new order_line_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_line_items_path, "post" do
      assert_select "input#order_line_item_quantity[name=?]", "order_line_item[quantity]"
      assert_select "input#order_line_item_price[name=?]", "order_line_item[price]"
      assert_select "input#order_line_item_subtotal[name=?]", "order_line_item[subtotal]"
      assert_select "input#order_line_item_order_id[name=?]", "order_line_item[order_id]"
    end
  end
end
