require 'spec_helper'
require 'cancan/matchers'

describe Note do

 shared_examples_for "customer owner" do
  it "is Mark Twain" do
   "#{subject.owner.firstname} #{subject.owner.lastname}".should == 'Mark Twain'
  end
 end

 describe "fyi" do
  subject { FactoryGirl.create(:customer_fyi) }
  its(:content) { should == 'remember to mark it' }
  it_should_behave_like "customer owner"
 end
 describe "todo" do
  subject { FactoryGirl.create(:customer_todo) }
  its(:content) { should == 'send him bill' }
  it_should_behave_like "customer owner"
 end
 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Note.new) }
   it { should be_able_to(:update, Note.new) }
   it { should be_able_to(:create, Note.new) }
   it { should be_able_to(:destroy, Note.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Note.new) }
   it { should be_able_to(:update, Note.new) }
   it { should be_able_to(:create, Note.new) }
   it { should be_able_to(:destroy, Note.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Note.new) }
   it { should_not be_able_to(:update, Note.new) }
   it { should_not be_able_to(:create, Note.new) }
   it { should_not be_able_to(:destroy, Note.new) }
  end
 end
end
