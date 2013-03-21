FactoryGirl.define do
 factory :admin, class: Role do
  name 'admin'
  description 'superuser!'
 end
 factory :manager, class: Role do
  name 'manager'
  description 'manager!'
 end
 factory :member, class: Role do
  name 'member'
  description 'member!'
 end
end
