require 'spec_helper'
require 'cancan/matchers'

describe AddressType do
 
 describe "fun" do
  before do
   @type = AddressType.new
   @name = random_string
   @description = random_string
   @type.name = @name
   @type.description = @description
  end
  subject { @type }
  its(:name) { should == @name }
  its(:description) { should == @description }
 end

 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, AddressType.new) }
   it { should be_able_to(:update, AddressType.new) }
   it { should be_able_to(:create, AddressType.new) }
   it { should be_able_to(:destroy, AddressType.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, AddressType.new) }
   it { should be_able_to(:update, AddressType.new) }
   it { should be_able_to(:create, AddressType.new) }
   it { should be_able_to(:destroy, AddressType.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, AddressType.new) }
   it { should_not be_able_to(:update, AddressType.new) }
   it { should_not be_able_to(:create, AddressType.new) }
   it { should_not be_able_to(:destroy, AddressType.new) }
  end
 end

end
