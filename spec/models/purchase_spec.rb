require 'spec_helper'
#require 'cancan/matchers'

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
    end
    it "creates a customer, address and order" do                 
      @purchase.save
      @cust = Customer.first
      @cust.firstname.should == 'Johanne' 
      @cust.lastname.should == 'Bach' 
      @cust.addresses.first.line_one.should == '2 Yellow Way'
      @cust.orders.length.should == 1
      @cust.orders.first.line_items.length.should == 1
      @cust.orders.first.line_items.first.product.name.should == 'Jimmyz'
    end      
    it "should set creator and updater for object -- and children -- with current user" do
      @purchase.customer.stub_chain(:fyis, :each)
      @purchase.customer.stub_chain(:todos, :each)
      @purchase.customer.stub_chain(:addresses, :each)
      @purchase.set_creator_and_updater_to_customer_children(FactoryGirl.create(:customer), @user).should be_true 
    end    
  end
  describe "when discount" do
    before do
      FactoryGirl.create(:address_type)
      FactoryGirl.create(:completed_order)
      @user = mock_model User, id: random_number
      create_product @user      
      @purchase = Purchase.new( customer_hash_of_purchase, @user ) 
    end
    describe "is blank" do
      it "returns unchanged total" do
        # yuck -- pls use mocks
        @total = random_number.to_i      
        discount_dollars = ''
        new_total = @purchase.apply_discount(@total, discount_dollars, @user)
        new_total.should == @total
      end
    end
    describe "is not blank" do
      it "returns changed total" do  
        # yuck -- pls use mocks
        @total_cents = random_number.to_i    
        discount_dollars = '2'
        new_total = @purchase.apply_discount(@total_cents, discount_dollars, @user)
        new_total.should == @total_cents-200
      end
    end
  end

end
