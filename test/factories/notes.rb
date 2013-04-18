# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 factory :note do
  association :creator, factory: :manager_user
  association :updater, factory: :manager_user
   
  factory :customer_fyi do
   content 'remember to mark it'
   type 'Fyi'
   association :notable, factory: :customer
  end

  factory :customer_todo do
   content 'send him bill'
   type 'Todo'
   association :notable, factory: :customer
  end

 end
end
