# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fabric_price do
    amount 100
    date Date.today 
    updated_by 1
    created_by 1
    fabric_id 1
  end
end
