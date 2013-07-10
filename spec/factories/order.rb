FactoryGirl.define do
 factory :order do
  purchase_date Date.today
  customer_id 1
  order_status_id 1
  purchase_amount 2500
  ispaid false
  creator
  updater
 end
 factory :blue_solid_order, class: Order do
  customer_id 1
  purchase_date Date.today
  purchase_amount 2000
  ispaid false
  order_status_id 1
  creator
  updater
  ignore do line_item_count 1 end
  after(:create) do |order, evaluator|
   FactoryGirl.create_list(:blue_solid_line_item, evaluator.line_item_count, order: order)
  end
 end
 factory :red_solid_order, class: Order do
  purchase_date Date.today
  purchase_amount 2000
  ispaid false
  order_status_id 1
  creator
  updater
  ignore do line_item_count 1 end
  after(:create) do |order, evaluator|
   FactoryGirl.create_list(:red_solid_line_item, evaluator.line_item_count, order: order)
  end
 end 
end
