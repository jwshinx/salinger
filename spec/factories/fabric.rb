FactoryGirl.define do
 factory :fabric, class:Fabric do
  creator
  updater

  factory :blue_flannel do
   name 'blue flannel' 
  end
  #factory :red_cotton, class: Fabric, aliases: [:fabric] do
  factory :red_cotton, aliases: [:red_cotton_fabric]  do
   name 'red cotton' 
  end
  factory :white_cotton do
   name 'white cotton' 
  end
  factory :green_cotton do
   name 'green cotton' 
  end
  factory :blue_cotton do
   name 'blue cotton' 
  end
  factory :yellow_cotton do
   name 'yellow cotton' 
  end
 end
end
