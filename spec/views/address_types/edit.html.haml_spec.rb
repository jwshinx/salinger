require 'spec_helper'

describe "address_types/edit" do
  before(:each) do
    @address_type = assign(:address_type, stub_model(AddressType,
      :name => "MyString",
      :description => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit address_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", address_type_path(@address_type), "post" do
      assert_select "input#address_type_name[name=?]", "address_type[name]"
      assert_select "input#address_type_description[name=?]", "address_type[description]"
      assert_select "input#address_type_created_by[name=?]", "address_type[created_by]"
      assert_select "input#address_type_updated_by[name=?]", "address_type[updated_by]"
    end
  end
end
