require 'spec_helper'

describe "mines/index" do
  before(:each) do
    assign(:mines, [
      stub_model(Mine,
        :name => "Name",
        :address => 1,
        :contact => "Contact"
      ),
      stub_model(Mine,
        :name => "Name",
        :address => 1,
        :contact => "Contact"
      )
    ])
  end

  it "renders a list of mines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
  end
end
