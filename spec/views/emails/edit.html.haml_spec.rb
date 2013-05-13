require 'spec_helper'

describe "emails/edit" do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      :content => "MyString",
      :email_type_id => 1,
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_path(@email), "post" do
      assert_select "input#email_content[name=?]", "email[content]"
      assert_select "input#email_email_type_id[name=?]", "email[email_type_id]"
      assert_select "input#email_created_by[name=?]", "email[created_by]"
      assert_select "input#email_updated_by[name=?]", "email[updated_by]"
    end
  end
end
