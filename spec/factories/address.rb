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
end
