require 'spec_helper'

describe "email_types/show" do
  before(:each) do
    @email_type = assign(:email_type, stub_model(EmailType,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
