FactoryGirl.define do
 factory :address, class: Address do
  creator
  updater
  factory :el_cerrito_address, aliases: [:el_cerrito] do 
   street '2000 San Pablo Blvd' 
   suite '#1500' 
   city 'El Cerrito'
   state 'CA'
   zip '95555'
  end
 end
 factory :berkeley_address, class: Address do
  created_by 1
  updated_by 1
  street '1500 MLK Blvd' 
  suite '#1500' 
  city 'Berkeley'
  state 'CA'
  zip '94005'
 end

end
