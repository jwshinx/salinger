require "spec_helper"
require 'cancan/matchers'

describe User do
 describe "admin joel" do
  #before { @joel = mock_model User, admin?: true }
  before { @joel = FactoryGirl.create(:admin_user, username: "joel#{random_string}", email: "j#{random_string}@yahkdi.com") }
  subject { @joel }
  specify { @joel.should be_valid } 
  its(:username) { should =~ /joel\w+/}
  its(:username) { should_not be_blank }
  its(:email) { should =~ /j\w+@yahkdi.com/ }
  its(:active) { should be_true }
  describe "role" do
   subject { @joel.role }
   its(:name) { should == 'admin' }
   its(:description) { should == 'superuser!' }
  end
 end

 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = mock_model User, admin?: true }
   it { should be_able_to(:read, User.new) }
   it { should be_able_to(:update, User.new) }
   it { should be_able_to(:create, User.new) }
   it { should be_able_to(:destroy, User.new) }
  end
  describe "for manager" do
   before(:each) { @user = mock_model User, manager?: true, admin?: false }
   it { should_not be_able_to(:read, User.new) }
   it { should_not be_able_to(:update, User.new) }
   it { should_not be_able_to(:create, User.new) }
   it { should_not be_able_to(:destroy, User.new) }
   it "should be able to update own information" do
    my_ability.should be_able_to(:update, @user) 
   end
  end
  describe "for all else" do
   before(:each) { @user = mock_model User, manager?: false, admin?: false }
   it { should_not be_able_to(:read, User.new) }
   it { should_not be_able_to(:update, User.new) }
   it { should_not be_able_to(:create, User.new) }
   it { should_not be_able_to(:destroy, User.new) }
  end
 end
end
