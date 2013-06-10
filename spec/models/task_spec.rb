require 'spec_helper'
require 'cancan/matchers'

describe Task do
 describe "normally" do
  subject { FactoryGirl.create(:task) }
  its(:title) { should == 'Wash Dishes' }
  its(:description) { should ==  'asap' }
  its(:due_date) { should ==  Date.today }
  its(:assigned_to) { should == 1 }
  its(:completed_on) { should == Date.today }
  its(:completed_by) { should ==  1 }
  its(:task_status_id) { should == 1 }
  its(:created_by) { should == 1 }
  its(:updated_by) { should == 1 }
 end
 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Task.new) }
   it { should be_able_to(:update, Task.new) }
   it { should be_able_to(:create, Task.new) }
   it { should be_able_to(:destroy, Task.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Task.new) }
   it { should be_able_to(:update, Task.new) }
   it { should be_able_to(:create, Task.new) }
   it { should be_able_to(:destroy, Task.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Task.new) }
   it { should_not be_able_to(:update, Task.new) }
   it { should_not be_able_to(:create, Task.new) }
   it { should_not be_able_to(:destroy, Task.new) }
  end
 end

end

