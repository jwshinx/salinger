require 'spec_helper'
require 'cancan/matchers'

describe Address do
  #its(:creator) { should == '95555' }

 describe "when perfect" do
  subject { FactoryGirl.create(:el_cerrito_address) }
  specify { subject.should be_valid }
  its(:street) { should == '2000 San Pablo Blvd' }
  its(:suite) { should == '#1500' }
  its(:city) { should == 'El Cerrito' }
  its(:state) { should == 'CA' }
  its(:zip) { should == '95555' }
 end
 describe "when street" do
  it "is blank throws exception" do
   expect {
    FactoryGirl.create(:address, :street => '')
   }.to raise_error(ActiveRecord::RecordInvalid, /Street is too short/)
  end
  it "is nil throws exception" do
   expect {
    FactoryGirl.create(:address, :street=> nil)
   }.to raise_error(ActiveRecord::RecordInvalid, /Street can't be blank/)
  end
 end

 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Address.new) }
   it { should be_able_to(:update, Address.new) }
   it { should be_able_to(:create, Address.new) }
   it { should be_able_to(:destroy, Address.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Address.new) }
   it { should be_able_to(:update, Address.new) }
   it { should be_able_to(:create, Address.new) }
   it { should be_able_to(:destroy, Address.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Address.new) }
   it { should_not be_able_to(:update, Address.new) }
   it { should_not be_able_to(:create, Address.new) }
   it { should_not be_able_to(:destroy, Address.new) }
  end
 end

end
