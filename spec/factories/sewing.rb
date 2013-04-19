FactoryGirl.define do
 factory :sewing do
  factory :red_sewing do
   association :fabric, factory: :red_cotton
   creator
   updater
  end
 end
end
