FactoryGirl.define do
 factory :blue_flannel, class: Fabric do 
  name 'blue flannel' 
  creator
  updater
 end
 factory :red_cotton, class: Fabric, aliases: [:fabric] do 
  name 'red cotton' 
  creator
  updater
 end
end