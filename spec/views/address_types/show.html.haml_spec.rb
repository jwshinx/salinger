require 'spec_helper'

describe "address_types/show" do
  before(:each) do
    @address_type = assign(:address_type, stub_model(AddressType,
      :name => "Name",
      :description => "Description",
      :created_by => 1,
      :updated_by => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
