FactoryGirl.define do
 factory :sewing do
  factory :red_sewing do
   association :fabric, factory: :red_cotton
   association :creator, factory: :manager_user
   association :updater, factory: :manager_user
  end
 end
end
