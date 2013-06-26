# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_status do
    title "MyString"
    description "MyText"
    updated_by 1
    created_by 1
  end
end
