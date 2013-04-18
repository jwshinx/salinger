FactoryGirl.define do
 factory :blue_flannel, class: Fabric do 
  name 'blue flannel' 
  association :creator, factory: :manager_user
  association :updater, factory: :manager_user
 end
 factory :red_cotton, class: Fabric do 
  name 'red cotton' 
  association :creator, factory: :manager_user
  association :updater, factory: :manager_user
 end
end
