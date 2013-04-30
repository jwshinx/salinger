FactoryGirl.define do
 factory :order do
  purchase_date Date.today
  customer_id 1
  purchase_amount 2500
  ispaid false
  creator
  updater
 end
end
