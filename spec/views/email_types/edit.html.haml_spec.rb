require 'spec_helper'

describe "email_types/edit" do
  before(:each) do
    @email_type = assign(:email_type, stub_model(EmailType,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit email_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_type_path(@email_type), "post" do
      assert_select "input#email_type_name[name=?]", "email_type[name]"
      assert_select "input#email_type_description[name=?]", "email_type[description]"
    end
  end
end
