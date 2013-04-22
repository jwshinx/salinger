require 'spec_helper'

describe "mines/edit" do
  before(:each) do
    @mine = assign(:mine, stub_model(Mine,
      :name => "MyString",
      :address => 1,
      :contact => "MyString"
    ))
  end

  it "renders the edit mine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mine_path(@mine), "post" do
      assert_select "input#mine_name[name=?]", "mine[name]"
      assert_select "input#mine_address[name=?]", "mine[address]"
      assert_select "input#mine_contact[name=?]", "mine[contact]"
    end
  end
end
