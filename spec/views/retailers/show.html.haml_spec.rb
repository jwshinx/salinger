require 'spec_helper'

describe "retailers/show" do
  before(:each) do
    @retailer = assign(:retailer, stub_model(Retailer,
      :name => "Name",
      :address_id => 1,
      :phone => "Phone",
      :contact => "Contact",
      :updated_by => 2,
      :created_by => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Phone/)
    rendered.should match(/Contact/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
