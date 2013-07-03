require 'spec_helper'
require 'cancan/matchers'

describe Customer do
 describe "normally" do
  let(:cust) { Customer.new }
  it "returns creator and updater" do
   username = "#{random_string}"
   cust.stub creator: double(username: username)
   cust.stub updater: double(username: username)
   cust.creator.username.should == username 
   cust.updater.username.should == username 
  end
  it "returns email" do
   email = "#{random_email}" 
   cust.stub email: email 
   cust.email.should == email 
  end
  it "returns firstname" do
   firstname = "#{random_string}" 
   cust.stub firstname: firstname
   cust.firstname.should == firstname
  end
  it "returns description" do
   description = "#{random_string}" 
   cust.stub description: description
   cust.description.should == description
  end
  it "returns lastname" do
   lastname = "#{random_string}" 
   cust.stub lastname: lastname
   cust.lastname.should == lastname
  end
  it "returns fullname" do
   fullname = "#{random_string} #{random_string}"  
   cust.stub fullname: fullname
   cust.fullname.should == fullname
  end
  it "returns todos and fyis" do
   todos_and_fyis = ['todo1', 'todo2', 'fyi1', 'fyi2']
   cust.stub todos_and_fyis: todos_and_fyis
   cust.todos_and_fyis.should == todos_and_fyis 
  end
  describe "when complete" do
   it "returns valid" do
    FactoryGirl.build(:mark_twain).should be_valid
   end
  end
 end
 describe "when incomplete" do
  describe "email" do
   describe "nil" do
    it "returns invalid" do FactoryGirl.build(:mark_twain, :email => nil).should_not be_valid end
   end
   describe "blank" do
    it "returns invalid" do FactoryGirl.build(:mark_twain, :email => '').should_not be_valid end
   end
  end
  describe "lastname" do
   describe "nil" do
    it "returns invalid" do FactoryGirl.build(:mark_twain, :lastname => nil).should_not be_valid end
   end
   describe "blank" do
    it "returns invalid" do FactoryGirl.build(:mark_twain, :lastname => '').should_not be_valid end
   end
  end
  describe "firstname" do
   describe "nil" do
    it "returns invalid" do FactoryGirl.build(:mark_twain, :firstname => nil).should_not be_valid end
   end
   describe "blank" do
    it "returns invalid" do FactoryGirl.build(:mark_twain, :firstname => '').should_not be_valid end
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
