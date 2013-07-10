FactoryGirl.define do
 factory :farm do 
  name 'Joann' 
  creator
  updater
  #el_cerrito 
  association :address, factory: :el_cerrito_address
  contact 'jane smith'
  phone '5102224444'
 end
 factory :michaels_farm, class: Farm do 
  name 'Michaels' 
  created_by 1
  updated_by 1
  #el_cerrito 
  association :address, factory: :berkeley_address
  contact 'michael jones'
  phone '5108887171'
 end

end
