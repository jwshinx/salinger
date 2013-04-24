# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_line_item do
    date "2013-04-24"
    quantity 1
    price 1
    subtotal 1
    order_id 1
  end
end
