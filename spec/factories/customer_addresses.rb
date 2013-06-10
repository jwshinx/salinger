# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer_address do
    name "Home"
    line_one "1 Main St"
    line_two "c/o mom"
    suite "101"
    city "La"
    state "CA"
    zip "90000"
    customer_id 1
    address_type_id 1
    created_by 1
    updated_by 1
  end
end
