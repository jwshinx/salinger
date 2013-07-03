FactoryGirl.define do
 factory :orange_argyle_line_item do 
  quantity 1 
  price 2500
  subtotal 2500 
  creator
  updater
  association :product, factory: :orange_argyle
  association :order, factory: :order
 end
 factory :red_solid_line_item, class: OrderLineItem do 
  quantity 1 
  price 2000
  subtotal 2000 
  association :product, factory: :red_solid
  creator
  updater
 end
 factory :blue_solid_line_item, class: OrderLineItem do 
  quantity 1 
  price 2000
  subtotal 2000 
  association :product, factory: :blue_solid
  creator
  updater
 end
end
