require 'spec_helper'
require 'cancan/matchers'

describe FabricPrice do
 describe "normally" do
  subject { FactoryGirl.create(:fabric_price) }
  its(:fabric_id) { should == 1 }
  its(:amount) { should == 100 }
  its(:date) { should == Date.today } 
  its(:created_by) { should == 1 }
  its(:updated_by) { should == 1 }
 end
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, FabricPrice.new) }
    it { should be_able_to(:update, FabricPrice.new) }
    it { should be_able_to(:create, FabricPrice.new) }
    it { should be_able_to(:destroy, FabricPrice.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, FabricPrice.new) }
    it { should be_able_to(:update, FabricPrice.new) }
    it { should be_able_to(:create, FabricPrice.new) }
    it { should be_able_to(:destroy, FabricPrice.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, FabricPrice.new) }
    it { should_not be_able_to(:update, FabricPrice.new) }
    it { should_not be_able_to(:create, FabricPrice.new) }
    it { should_not be_able_to(:destroy, FabricPrice.new) }
   end
 end
end
