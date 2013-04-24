require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :customer_id => 1,
      :purchase_amount => 1.5,
      :paid_amount => 1.5,
      :updated_by => 1,
      :created_by => 1,
      :ispaid => false
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "input#order_customer_id[name=?]", "order[customer_id]"
      assert_select "input#order_purchase_amount[name=?]", "order[purchase_amount]"
      assert_select "input#order_paid_amount[name=?]", "order[paid_amount]"
      assert_select "input#order_updated_by[name=?]", "order[updated_by]"
      assert_select "input#order_created_by[name=?]", "order[created_by]"
      assert_select "input#order_ispaid[name=?]", "order[ispaid]"
    end
  end
end
