require 'spec_helper'

describe "mines/new" do
  before(:each) do
    assign(:mine, stub_model(Mine,
      :name => "MyString",
      :address => 1,
      :contact => "MyString"
    ).as_new_record)
  end

  it "renders new mine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mines_path, "post" do
      assert_select "input#mine_name[name=?]", "mine[name]"
      assert_select "input#mine_address[name=?]", "mine[address]"
      assert_select "input#mine_contact[name=?]", "mine[contact]"
    end
  end
end
