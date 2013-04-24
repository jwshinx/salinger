# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    purchase_date "2013-04-24"
    paid_date "2013-04-24"
    customer_id 1
    purchase_amount 1.5
    paid_amount 1.5
    updated_by 1
    created_by 1
    ispaid false
  end
end
