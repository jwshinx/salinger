require 'spec_helper'

describe "retailers/index" do
  before(:each) do
    assign(:retailers, [
      stub_model(Retailer,
        :name => "Name",
        :address_id => 1,
        :phone => "Phone",
        :contact => "Contact",
        :updated_by => 2,
        :created_by => 3
      ),
      stub_model(Retailer,
        :name => "Name",
        :address_id => 1,
        :phone => "Phone",
        :contact => "Contact",
        :updated_by => 2,
        :created_by => 3
      )
    ])
  end

  it "renders a list of retailers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
