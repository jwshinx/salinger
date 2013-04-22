require 'spec_helper'

describe "addresses/edit" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :street => "MyString",
      :suite => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :updated_by => 1,
      :created_by => 1
    ))
  end

  it "renders the edit address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", address_path(@address), "post" do
      assert_select "input#address_street[name=?]", "address[street]"
      assert_select "input#address_suite[name=?]", "address[suite]"
      assert_select "input#address_city[name=?]", "address[city]"
      assert_select "input#address_state[name=?]", "address[state]"
      assert_select "input#address_zip[name=?]", "address[zip]"
      assert_select "input#address_updated_by[name=?]", "address[updated_by]"
      assert_select "input#address_created_by[name=?]", "address[created_by]"
    end
  end
end
