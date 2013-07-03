FactoryGirl.define do
 factory :product, class: Product do
  description 'simple. comfy.'
  count 1
  creator
  updater

  factory :orange_argyle do
   name 'orange argyle'
   price 1999 
  end

  factory :red_solid do
   name 'red solid'
   price 9999 
   ignore { sewings_count 1 }
   after(:create) { |product, evaluator| 
    FactoryGirl.create_list(:red_cotton_sewing , evaluator.sewings_count, product: product) 
   }
  end
  factory :blue_solid do
   name 'blue solid'
   price 3500 
   ignore { sewings_count 1 }
   after(:create) { |product, evaluator| 
    FactoryGirl.create_list(:blue_cotton_sewing , evaluator.sewings_count, product: product) 
   }
  end
  factory :pink_solid do
   name 'pink solid'
   price 3500 
   ignore { sewings_count 1 }
   after(:create) { |product, evaluator| 
    FactoryGirl.create_list(:blue_cotton_sewing , evaluator.sewings_count, product: product) 
   }
  end
=begin
  this doesnt work because of product's sewing count must be at least one. 
  trait :packers_info do 
   name 'packers home'
   price 7500 
  end
  trait :has_green_fabric do 
   ignore { sewings_count 1 }
   after(:create) { |product, evaluator| 
    FactoryGirl.create_list(:green_cotton_sewing , evaluator.sewings_count, product: product) 
   }
  end
  trait :has_yellow_fabric do 
   ignore { sewings_count 1 }
   after(:create) { |product, evaluator| 
    FactoryGirl.create_list(:yellow_cotton_sewing , evaluator.sewings_count, product: product) 
   }
  end
  factory :packers_home, traits: [:has_yellow_fabric, :has_green_fabric, :packers_info ]
=end
 end
end
