# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 factory :email do
  email_type_id 1
  created_by 1
  updated_by 1

  factory :valid_email do content "one@yahoo.com" end
  factory :blank_email do content "" end
  factory :whitespace_email do content " " end
  factory :gibberish_email do content "dididiid" end
  factory :no_at_symbol_email do content "oneyahoo.com" end

 end
 factory :anonymous_email, class: Email do
  email_type_id 1
  content "three@yahoo.com" 
 end
end
