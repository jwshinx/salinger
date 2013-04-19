FactoryGirl.define do
 factory :user, class: User do
  sequence(:username) {|n| "joel#{n}" }
  sequence(:email) {|n| "joel#{n}@yahoo.com" }
  password '1234abcd'
  password_confirmation '1234abcd'

  factory :manager_user, aliases: [:creator, :updater] do
   association :role, factory: :manager
  end
  factory :admin_user do
   association :role, factory: :admin
  end
  factory :member_user do
   association :role, factory: :member
  end
 end
end
