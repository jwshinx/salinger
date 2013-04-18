# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    firstname "Mark"
    lastname "Twain"
    email "mt@yahoo.com"
    description "he used to be samuel clemens"
    association :creator, factory: :manager_user
    association :updater, factory: :manager_user
  end
end
