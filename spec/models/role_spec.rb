require "spec_helper"
require 'cancan/matchers'

describe Role do
 describe "admin" do
  subject { FactoryGirl.create(:admin) }
  specify { subject.should be_valid } 
  its(:name) { should == 'admin' }
  its(:name) { should_not be_blank }
  its(:description) { should == 'superuser!' }
  its(:description) { should_not be_blank }
 end
 describe "when name" do
  it "is blank throws exception" do 
   expect { 
    FactoryGirl.create(:admin, :name => '') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/) 
  end
  it "is nil throws exception" do 
   expect { 
    FactoryGirl.create(:admin, :name => nil) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/) 
  end
 end
 describe "when description" do
  it "is blank throws exception" do 
   expect { 
    FactoryGirl.create(:admin, :description => '') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Description is too short/) 
  end
  it "is nil throws exception" do 
   expect { 
    FactoryGirl.create(:admin, :description => nil) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Description can't be blank/) 
  end
 end
 describe "privilege" do
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   it { should be_able_to(:read, Role.new) }
   it { should be_able_to(:update, Role.new) }
   it { should be_able_to(:create, Role.new) }
   it { should be_able_to(:destroy, Role.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   it { should be_able_to(:read, Role.new) }
   it { should_not be_able_to(:update, Role.new) }
   it { should_not be_able_to(:create, Role.new) }
   it { should_not be_able_to(:destroy, Role.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   it { should_not be_able_to(:read, Role.new) }
   it { should_not be_able_to(:update, Role.new) }
   it { should_not be_able_to(:create, Role.new) }
   it { should_not be_able_to(:destroy, Role.new) }
  end
 end
end
