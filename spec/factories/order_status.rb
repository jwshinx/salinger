# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :completed_order, class: OrderStatus do
    title "Complete"
    description "Done."
    created_by 1
    updated_by 1
  end
end
