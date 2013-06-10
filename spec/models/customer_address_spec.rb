require 'spec_helper'
require 'cancan/matchers'

describe CustomerAddress do
 describe "normally" do
  subject { FactoryGirl.create(:customer_address) }
  its(:name) { should == 'Home' }
  its(:line_one) { should == '1 Main St' }
  its(:line_two) { should == 'c/o mom' }
  its(:suite) { should == '101' }
  its(:city) { should == 'La' }
  its(:state) { should == 'CA' }
  its(:zip) { should == '90000' }
  its(:customer_id) { should == 1 }
  its(:address_type_id) { should == 1 }
  its(:created_by) { should == 1 }
  its(:updated_by) { should == 1 }
 end
 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, CustomerAddress.new) }
   it { should be_able_to(:update, CustomerAddress.new) }
   it { should be_able_to(:create, CustomerAddress.new) }
   it { should be_able_to(:destroy, CustomerAddress.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, CustomerAddress.new) }
   it { should be_able_to(:update, CustomerAddress.new) }
   it { should be_able_to(:create, CustomerAddress.new) }
   it { should be_able_to(:destroy, CustomerAddress.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, CustomerAddress.new) }
   it { should_not be_able_to(:update, CustomerAddress.new) }
   it { should_not be_able_to(:create, CustomerAddress.new) }
   it { should_not be_able_to(:destroy, CustomerAddress.new) }
  end
 end

end
