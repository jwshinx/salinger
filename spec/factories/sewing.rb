FactoryGirl.define do
 factory :sewing do
  creator
  updater

  factory :red_cotton_sewing do
   #red_cotton_fabric # association :fabric, factory: :red_cotton
   association :fabric, factory: :red_cotton
  end
  factory :blue_cotton_sewing do
   association :fabric, factory: :blue_cotton
  end
  factory :yellow_cotton_sewing do
   association :fabric, factory: :yellow_cotton
  end
  factory :green_cotton_sewing do
   association :fabric, factory: :green_cotton
  end
  factory :white_cotton_sewing do
   association :fabric, factory: :white_cotton
  end
 end
end
