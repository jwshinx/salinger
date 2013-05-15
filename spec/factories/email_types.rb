# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_signup, class: EmailType do
    name "Email Signup"
    description "signup for discounts"
    created_by 1 
    updated_by 1 
  end
end
