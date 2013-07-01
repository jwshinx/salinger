require 'spec_helper'
require 'cancan/matchers'

describe OrderLineItem do
 before do
  @li = OrderLineItem.new({created_by:1, updated_by:1})
  @qty = random_number; @li.quantity = @qty
  @price = random_number; @li.price = @price
  @subtotal = random_number; @li.subtotal = @subtotal
 end
 subject { @li }
 specify { subject.should be_valid }
 its(:quantity) { should == @qty.to_i }
 its(:price) { should == @price.to_i }
 its(:subtotal) { should == @subtotal.to_i }
 describe "privileges" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, OrderLineItem.new) }
   it { should be_able_to(:update, OrderLineItem.new) }
   it { should be_able_to(:create, OrderLineItem.new) }
   it { should be_able_to(:destroy, OrderLineItem.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, OrderLineItem.new) }
   it { should be_able_to(:update, OrderLineItem.new) }
   it { should be_able_to(:create, OrderLineItem.new) }
   it { should be_able_to(:destroy, OrderLineItem.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, OrderLineItem.new) }
   it { should_not be_able_to(:update, OrderLineItem.new) }
   it { should_not be_able_to(:create, OrderLineItem.new) }
   it { should_not be_able_to(:destroy, OrderLineItem.new) }
  end
 end
end
