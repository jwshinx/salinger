FactoryGirl.define do
 factory :user, class: User do
  username 'joel'
  email 'joel@webpass.net'
  password '1234abcd'
  password_confirmation '1234abcd'

  factory :manager_user do
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
