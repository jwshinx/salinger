require 'spec_helper'
require 'cancan/matchers'

describe Customer do
 describe "normally" do
  subject { FactoryGirl.create(:customer) }
  its(:firstname) { should == 'Mark' }
  its(:lastname) { should == 'Twain' }
  its(:email) { should == 'mt@yahoo.com' }
  its(:description) { should == 'he used to be samuel clemens' }
 end
 describe "incomplete with" do
  before { @c = Customer.new :firstname => 'John', :lastname => 'Smith', :email => 'js@gmail.com', :description => 'dkdk' }
  describe "blank firstname" do
   its "is not valid" do
    @c.firstname = ''
    @c.should_not be_valid
   end
  end
  describe "nil firstname" do
   its "is not valid" do
    @c.firstname = nil 
    @c.should_not be_valid
   end
  end
  describe "blank lastname" do
   its "is not valid" do
    @c.lastname = ''
    @c.should_not be_valid
   end
  end
  describe "nil lastname" do
   its "is not valid" do
    @c.lastname = nil 
    @c.should_not be_valid
   end
  end
  describe "blank email" do
   its "is not valid" do
    @c.email = ''
    @c.should_not be_valid
   end
  end
  describe "nil email" do
   its "is not valid" do
    @c.email = nil 
    @c.should_not be_valid
   end
  end
 end

 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Customer.new) }
   it { should be_able_to(:update, Customer.new) }
   it { should be_able_to(:create, Customer.new) }
   it { should be_able_to(:destroy, Customer.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Customer.new) }
   it { should be_able_to(:update, Customer.new) }
   it { should be_able_to(:create, Customer.new) }
   it { should be_able_to(:destroy, Customer.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Customer.new) }
   it { should_not be_able_to(:update, Customer.new) }
   it { should_not be_able_to(:create, Customer.new) }
   it { should_not be_able_to(:destroy, Customer.new) }
  end
 end

end
