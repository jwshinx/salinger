FactoryGirl.define do
 factory :orange_argyle, class: Product do
  name 'orange argyle'
  description 'orange color with yellow, white print'
  price 39.99
  creator
  updater
 end
 factory :red_solid, class: Product do
  name 'red solid'
  description 'simple. comfy like a tshirt'
  price 25.50 
  creator
  updater
  ignore { sewings_count 1 }
  after(:create) { |product, evaluator| FactoryGirl.create_list(:red_sewing , evaluator.sewings_count, product: product) }
 end
end
