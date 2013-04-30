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
end
