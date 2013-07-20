require 'spec_helper'
#require 'cancan/matchers'
require 'example_helper'

describe Purchase do 
 include ExampleHelper       
 describe "when successful" do 
  before do
   #@user = FactoryGirl.build(:admin_user)
   FactoryGirl.create(:address_type)
   FactoryGirl.create(:completed_order)
   @user = mock_model User, id: random_number
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
=begin
  describe "when discount" do
   before do
     @user = mock_model User, id: random_number
     @purchase = Purchase.new({}, @user)
     @total = random_number.to_i
   end
   describe "not provided" do
     it "returns identical amount" do
      discount_dollars = ''
      new_total = @purchase.apply_discount(@total, discount_dollars, mock_model(User))
      new_total.should == @total
     end  
   end
   describe "provided" do
    it "returns smaller, discounted amount" do
     discount_dollars = '1.25'
     bs_order = FactoryGirl.build(:red_solid_order, customer: FactoryGirl.create(:charles_dickens))
     new_total = @purchase.apply_discount(bs_order, @total, discount_dollars, mock_model(User))
     new_total.should == @total - 125
    end  
   end
  end
=end

end
