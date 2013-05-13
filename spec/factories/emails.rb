# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    content "MyString"
    email_type_id 1
    created_by 1
    updated_by 1
  end
end
