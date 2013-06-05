# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer_address do
    name "MyString"
    line_one "MyString"
    line_two "MyString"
    suite "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
  end
end
