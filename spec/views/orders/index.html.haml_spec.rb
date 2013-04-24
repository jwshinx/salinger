require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :customer_id => 1,
        :purchase_amount => 1.5,
        :paid_amount => 1.5,
        :updated_by => 2,
        :created_by => 3,
        :ispaid => false
      ),
      stub_model(Order,
        :customer_id => 1,
        :purchase_amount => 1.5,
        :paid_amount => 1.5,
        :updated_by => 2,
        :created_by => 3,
        :ispaid => false
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
