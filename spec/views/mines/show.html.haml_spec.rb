require 'spec_helper'

describe "mines/show" do
  before(:each) do
    @mine = assign(:mine, stub_model(Mine,
      :name => "Name",
      :address => 1,
      :contact => "Contact"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Contact/)
  end
end
