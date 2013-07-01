require 'spec_helper'
require 'cancan/matchers'

describe TaskStatusType do
 describe "normally" do
  before do
   @status = TaskStatusType.new({created_by: 1, updated_by: 1})
   @name = random_string; @status.name = @name
   @description = random_string; @status.description = @description
  end
  subject { @status }
  its(:name) { should == @name }
  its(:description) { should == @description }
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

