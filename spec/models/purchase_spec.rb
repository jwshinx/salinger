require 'spec_helper'
#require 'cancan/matchers'
require 'example_helper'

describe Purchase do 
 include ExampleHelper
 describe "xxx" do 
  it "vvv" do
   user = FactoryGirl.create(:admin_user)
   FactoryGirl.create(:address_type)
   FactoryGirl.create(:completed_order)
   create_product user
   @purchase = Purchase.new( customer_hash_of_purchase, user ) 
   puts "---> 1 #{Customer.all.inspect}" 
   puts "---> 2 #{Product.all.inspect}" 
   puts "---> 3 #{Fabric.all.inspect}" 
   puts "---> 4 #{Sewing.all.inspect}" 
   puts "---> 5 #{Order.all.inspect}" 
   puts "---> 5.1 #{OrderStatus.all.inspect}" 
   puts "---> 6 #{OrderLineItem.all.inspect}" 
   puts "---> 7 #{CustomerAddress.all.inspect}" 
   puts "---> 8 #{AddressType.all.inspect}" 
  end
 end
end
