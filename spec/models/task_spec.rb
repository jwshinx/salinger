require 'spec_helper'
require 'cancan/matchers'

describe Task do
 describe "normally" do
  before do
   @task = Task.new({created_by: 1, updated_by:1 })
   @title = random_string; @task.title = @title
   @description = random_string; @task.description = @description
   @due_date = Date.today; @task.due_date = @due_date
   @completed_on = Date.today; @task.completed_on = @completed_on
  end
  subject { @task }
  its(:title) { should == @title } 
  its(:description) { should == @description } 
  its(:due_date) { should == @due_date } 
  its(:completed_on) { should == @completed_on }
  it "returns status" do
   task_status = mock_model TaskStatusType, name: 'Complete'
   @task.status = task_status 
   @task.status.name.should == 'Complete'
  end
  describe "blurb" do
    it "returns title" do
      pending
    end
  end
  describe "without task status" do
   it "returns error" do
    expect {
     @task.save!
    }.to raise_error(ActiveRecord::StatementInvalid)
   end
  end
 end
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, Task.new) }
    it { should be_able_to(:update, Task.new) }
    it { should be_able_to(:create, Task.new) }
    it { should be_able_to(:destroy, Task.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, Task.new) }
    it { should be_able_to(:update, Task.new) }
    it { should be_able_to(:create, Task.new) }
    it { should be_able_to(:destroy, Task.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, Task.new) }
    it { should_not be_able_to(:update, Task.new) }
    it { should_not be_able_to(:create, Task.new) }
    it { should_not be_able_to(:destroy, Task.new) }
   end
 end
end

