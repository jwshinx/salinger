require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :street => "Street",
        :suite => "Suite",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :updated_by => 1,
        :created_by => 2
      ),
      stub_model(Address,
        :street => "Street",
        :suite => "Suite",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :updated_by => 1,
        :created_by => 2
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Suite".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
