require 'spec_helper'

describe "customer_addresses/edit" do
  before(:each) do
    @customer_address = assign(:customer_address, stub_model(CustomerAddress,
      :name => "MyString",
      :line_one => "MyString",
      :line_two => "MyString",
      :suite => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders the edit customer_address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customer_address_path(@customer_address), "post" do
      assert_select "input#customer_address_name[name=?]", "customer_address[name]"
      assert_select "input#customer_address_line_one[name=?]", "customer_address[line_one]"
      assert_select "input#customer_address_line_two[name=?]", "customer_address[line_two]"
      assert_select "input#customer_address_suite[name=?]", "customer_address[suite]"
      assert_select "input#customer_address_city[name=?]", "customer_address[city]"
      assert_select "input#customer_address_state[name=?]", "customer_address[state]"
      assert_select "input#customer_address_zip[name=?]", "customer_address[zip]"
    end
  end
end
