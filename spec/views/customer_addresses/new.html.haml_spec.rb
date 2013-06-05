require 'spec_helper'

describe "customer_addresses/new" do
  before(:each) do
    assign(:customer_address, stub_model(CustomerAddress,
      :name => "MyString",
      :line_one => "MyString",
      :line_two => "MyString",
      :suite => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ).as_new_record)
  end

  it "renders new customer_address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customer_addresses_path, "post" do
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
