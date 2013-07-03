require 'spec_helper'
#require 'cancan/matchers'
require 'example_helper'

describe Purchase do 
 include ExampleHelper
 describe "when successful" do 
  before do
   @user = FactoryGirl.create(:admin_user)
   FactoryGirl.create(:address_type)
   FactoryGirl.create(:completed_order)
   create_product @user
   @purchase = Purchase.new( customer_hash_of_purchase, @user ) 
   @purchase.save
   @cust = Customer.first
  end
  it "creates a customer, address and order" do
   @cust.firstname.should == 'Johanne' 
   @cust.lastname.should == 'Bach' 
   @cust.addresses.first.line_one.should == '2 Yellow Way'
   @cust.orders.length.should == 1
   @cust.orders.first.line_items.length.should == 1
   @cust.orders.first.line_items.first.product.name.should == 'Jimmyz'
  end
 end
end
