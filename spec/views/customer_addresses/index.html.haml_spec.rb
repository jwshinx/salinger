require 'spec_helper'

describe "customer_addresses/index" do
  before(:each) do
    assign(:customer_addresses, [
      stub_model(CustomerAddress,
        :name => "Name",
        :line_one => "Line One",
        :line_two => "Line Two",
        :suite => "Suite",
        :city => "City",
        :state => "State",
        :zip => "Zip"
      ),
      stub_model(CustomerAddress,
        :name => "Name",
        :line_one => "Line One",
        :line_two => "Line Two",
        :suite => "Suite",
        :city => "City",
        :state => "State",
        :zip => "Zip"
      )
    ])
  end

  it "renders a list of customer_addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Line One".to_s, :count => 2
    assert_select "tr>td", :text => "Line Two".to_s, :count => 2
    assert_select "tr>td", :text => "Suite".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
  end
end
