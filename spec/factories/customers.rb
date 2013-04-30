# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 factory :customer, aliases: [:notable, :mark_twain] do
  firstname "Mark"
  lastname "Twain"
  email "mt@yahoo.com"
  description "he used to be samuel clemens"
  creator
  updater
 end

 factory :lebron, class: Customer do
  firstname "Lebron"
  lastname "James"
  email "lj@yahoo.com"
  description "the king"
  creator
  updater
  ignore do order_count 1 end
  after(:create) do |customer, evaluator|
   FactoryGirl.create_list(:red_solid_order, evaluator.order_count, customer: customer)
  end
 end
end
