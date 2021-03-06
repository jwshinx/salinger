# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 factory :note do
  creator
  updater
   
  factory :customer_fyi do
   content 'remember to mark it'
   type 'Fyi'
   notable # association :notable, factory: :customer
  end

  factory :customer_todo do
   content 'send him bill'
   type 'Todo'
   notable # association :notable, factory: :customer
  end

 end
end
