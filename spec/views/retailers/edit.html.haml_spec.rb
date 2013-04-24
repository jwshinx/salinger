require 'spec_helper'

describe "retailers/edit" do
  before(:each) do
    @retailer = assign(:retailer, stub_model(Retailer,
      :name => "MyString",
      :address_id => 1,
      :phone => "MyString",
      :contact => "MyString",
      :updated_by => 1,
      :created_by => 1
    ))
  end

  it "renders the edit retailer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", retailer_path(@retailer), "post" do
      assert_select "input#retailer_name[name=?]", "retailer[name]"
      assert_select "input#retailer_address_id[name=?]", "retailer[address_id]"
      assert_select "input#retailer_phone[name=?]", "retailer[phone]"
      assert_select "input#retailer_contact[name=?]", "retailer[contact]"
      assert_select "input#retailer_updated_by[name=?]", "retailer[updated_by]"
      assert_select "input#retailer_created_by[name=?]", "retailer[created_by]"
    end
  end
end
