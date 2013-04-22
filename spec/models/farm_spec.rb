require 'spec_helper'
require 'cancan/matchers'

describe Farm do
 describe "when perfect" do
  subject { FactoryGirl.create(:farm) }
  specify { subject.should be_valid }
  its(:name) { should == 'Joann' }
  its "returns street 2000 San Pablo Blvd" do 
   subject.address.street.should == '2000 San Pablo Blvd'
  end
  its "returns suite #1500" do 
   subject.address.suite.should == '#1500'
  end
  its "returns city El Cerrito" do 
   subject.address.city.should == 'El Cerrito'
  end
  its "returns state CA" do 
   subject.address.state.should == 'CA'
  end
  its "returns zip 95555" do 
   subject.address.zip.should == '95555'
  end
 end
 describe "when name" do
  it "is blank throws exception" do
   expect {
    FactoryGirl.create(:farm, :name => '')
   }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/)
  end
  it "is nil throws exception" do
   expect {
    FactoryGirl.create(:farm, :name => nil)
   }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/)
  end
 end

 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Farm.new) }
   it { should be_able_to(:update, Farm.new) }
   it { should be_able_to(:create, Farm.new) }
   it { should be_able_to(:destroy, Farm.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Farm.new) }
   it { should be_able_to(:update, Farm.new) }
   it { should be_able_to(:create, Farm.new) }
   it { should be_able_to(:destroy, Farm.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Farm.new) }
   it { should_not be_able_to(:update, Farm.new) }
   it { should_not be_able_to(:create, Farm.new) }
   it { should_not be_able_to(:destroy, Farm.new) }
  end
 end

end
