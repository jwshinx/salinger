require 'spec_helper'

describe "customer_addresses/show" do
  before(:each) do
    @customer_address = assign(:customer_address, stub_model(CustomerAddress,
      :name => "Name",
      :line_one => "Line One",
      :line_two => "Line Two",
      :suite => "Suite",
      :city => "City",
      :state => "State",
      :zip => "Zip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Line One/)
    rendered.should match(/Line Two/)
    rendered.should match(/Suite/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip/)
  end
end
