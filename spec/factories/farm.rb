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
end
