require 'spec_helper'

describe "address_types/index" do
  before(:each) do
    assign(:address_types, [
      stub_model(AddressType,
        :name => "Name",
        :description => "Description",
        :created_by => 1,
        :updated_by => 2
      ),
      stub_model(AddressType,
        :name => "Name",
        :description => "Description",
        :created_by => 1,
        :updated_by => 2
      )
    ])
  end

  it "renders a list of address_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
