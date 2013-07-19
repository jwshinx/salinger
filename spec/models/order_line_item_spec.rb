require 'spec_helper'
require 'cancan/matchers'

describe OrderLineItem do
 before do
  #@li = OrderLineItem.new({created_by:1, updated_by:1})
  @li = OrderLineItem.new
  @qty = random_number; @li.quantity = @qty
  @price = random_number; @li.price = @price
  @subtotal = random_number; @li.subtotal = @subtotal
 end
 subject { @li }
 specify { subject.should be_valid }
 its(:quantity) { should == @qty.to_i }
 its(:price) { should == @price.to_i }
 its(:subtotal) { should == @subtotal.to_i } 
 
 it "returns creator and updater" do
  username = "#{random_string}"
  @li.creator = mock_model(User, id: 1, username: username)
  @li.updater = mock_model(User, id: 1, username: username)
  @li.creator.username.should == username 
  @li.updater.username.should == username 
 end 
 
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, OrderLineItem.new) }
    it { should be_able_to(:update, OrderLineItem.new) }
    it { should be_able_to(:create, OrderLineItem.new) }
    it { should be_able_to(:destroy, OrderLineItem.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, OrderLineItem.new) }
    it { should be_able_to(:update, OrderLineItem.new) }
    it { should be_able_to(:create, OrderLineItem.new) }
    it { should be_able_to(:destroy, OrderLineItem.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, OrderLineItem.new) }
    it { should_not be_able_to(:update, OrderLineItem.new) }
    it { should_not be_able_to(:create, OrderLineItem.new) }
    it { should_not be_able_to(:destroy, OrderLineItem.new) }
   end
 end 
end
