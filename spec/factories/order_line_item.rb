FactoryGirl.define do
 factory :order_line_item do 
  quantity 1 
  price 2500
  subtotal 2500 
  creator
  updater
  association :product, factory: :orange_argyle
  association :order, factory: :order
 end
end
