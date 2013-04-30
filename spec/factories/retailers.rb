# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :retailer do
    name "MyString"
    address_id 1
    phone "MyString"
    contact "MyString"
    updated_by 1
    created_by 1
  end
end
