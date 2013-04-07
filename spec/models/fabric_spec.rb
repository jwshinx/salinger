require "spec_helper"
require 'cancan/matchers'

describe Fabric do
 describe "when perfect" do
  subject { FactoryGirl.create(:blue_flannel) }
  specify { subject.should be_valid } 
  its(:name) { should == 'blue flannel' }
  its(:name) { should_not be_blank }
 end
 describe "when name" do
  it "is blank throws exception" do 
   expect { 
    FactoryGirl.create(:blue_flannel, :name => '') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/) 
  end
  it "is nil throws exception" do 
   expect { 
    FactoryGirl.create(:blue_flannel, :name => nil) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/) 
  end
 end
 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Fabric.new) }
   it { should be_able_to(:update, Fabric.new) }
   it { should be_able_to(:create, Fabric.new) }
   it { should be_able_to(:destroy, Fabric.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Fabric.new) }
   it { should be_able_to(:update, Fabric.new) }
   it { should be_able_to(:create, Fabric.new) }
   it { should be_able_to(:destroy, Fabric.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Fabric.new) }
   it { should_not be_able_to(:update, Fabric.new) }
   it { should_not be_able_to(:create, Fabric.new) }
   it { should_not be_able_to(:destroy, Fabric.new) }
  end
 end
end
