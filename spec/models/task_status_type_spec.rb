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
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, TaskStatusType.new) }
    it { should be_able_to(:update, TaskStatusType.new) }
    it { should be_able_to(:create, TaskStatusType.new) }
    it { should be_able_to(:destroy, TaskStatusType.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, TaskStatusType.new) }
    it { should be_able_to(:update, TaskStatusType.new) }
    it { should be_able_to(:create, TaskStatusType.new) }
    it { should be_able_to(:destroy, TaskStatusType.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, TaskStatusType.new) }
    it { should_not be_able_to(:update, TaskStatusType.new) }
    it { should_not be_able_to(:create, TaskStatusType.new) }
    it { should_not be_able_to(:destroy, TaskStatusType.new) }
   end
 end 
end

