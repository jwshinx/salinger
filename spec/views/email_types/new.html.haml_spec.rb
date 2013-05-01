require 'spec_helper'

describe "email_types/new" do
  before(:each) do
    assign(:email_type, stub_model(EmailType,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new email_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_types_path, "post" do
      assert_select "input#email_type_name[name=?]", "email_type[name]"
      assert_select "input#email_type_description[name=?]", "email_type[description]"
    end
  end
end
