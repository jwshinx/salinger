require 'spec_helper'
require 'cancan/matchers'

describe Note do

 shared_examples_for "customer owner" do
  it "is Mark Twain" do
   "#{subject.owner.firstname} #{subject.owner.lastname}".should == 'Mark Twain'
  end
 end

 describe "todo note" do
   before(:each) { @todo = Note.new }
   it "returns content" do
     text = random_string
     @todo.content = text
     @todo.content.should == text
   end
   it "returns owner fullname" do
    @user = mock_model User, fullname: 'mad max'
    @todo.notable = @user
    @todo.owner.fullname.should == 'mad max'
   end
  
 end
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, Note.new) }
    it { should be_able_to(:update, Note.new) }
    it { should be_able_to(:create, Note.new) }
    it { should be_able_to(:destroy, Note.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, Note.new) }
    it { should be_able_to(:update, Note.new) }
    it { should be_able_to(:create, Note.new) }
    it { should be_able_to(:destroy, Note.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, Note.new) }
    it { should_not be_able_to(:update, Note.new) }
    it { should_not be_able_to(:create, Note.new) }
    it { should_not be_able_to(:destroy, Note.new) }
   end
 end
=begin
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
=end
end
