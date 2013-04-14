require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :email => "Email",
        :description => "Description"
      ),
      stub_model(Customer,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :email => "Email",
        :description => "Description"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
