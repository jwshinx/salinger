require 'spec_helper'
require 'cancan/matchers'

describe Customer do                 
 describe "with monkeypatched string class" do
   describe "fullname 'barack obama'" do
     it "returns 'barack_obama'" do                              
       @customer = Customer.new               
       @customer.stub firstname: 'barack', lastname: 'obama'
       @customer.fullname.underscored.should == 'barack_obama'
     end
   end
 end
 describe "check uniqueness of" do
  describe "firstname-lastname combination" do
   it "sss" do                              
    pending 
    Customer.find_by_firstname_and_lastname('Charles', 'Dickens').should_not be_nil
   end
  end
 end
 describe "normally" do
  let(:cust) { Customer.new }
  it "returns creator and updater" do
   username = "#{random_string}"
   cust.creator = mock_model(User, id: 1, username: username)
   cust.updater = mock_model(User, id: 1, username: username)
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
  it "returns blurb" do
   blurb = "#{random_string}" 
   cust.stub blurb: blurb
   cust.blurb.should == blurb
  end   
  
  it "returns todos and fyis" do
   todos_and_fyis = ['todo1', 'todo2', 'fyi1', 'fyi2']
   cust.stub todos_and_fyis: todos_and_fyis
   cust.todos_and_fyis.should == todos_and_fyis 
  end
  describe "when complete" do
   it "returns valid" do
    FactoryGirl.build(:charles_dickens).should be_valid
   end
  end   
  describe "recent orders" do
   it "returns array of orders by-recent-purchase-date" do
    by_recent_date_orders = [] 
    older = mock_model(Order, purchase_date: 3.days.ago) 
    newer = mock_model(Order, purchase_date: Date.today) 
    by_recent_date_orders << newer << older
    cust.should_receive(:orders).and_return(double('arel', :order => by_recent_date_orders))
    cust.recent_orders.should == [newer, older] 
   end
  end
  describe "last order" do
   it "returns order object" do
    order = mock_model(Order)
    cust.stub last_order: order 
    cust.last_order.should == order 
   end
  end
 end
 describe "when incomplete" do
  describe "email" do
   describe "nil" do
    it "returns invalid" do FactoryGirl.build(:charles_dickens, :email => nil).should_not be_valid end
   end
   describe "blank" do
    it "returns invalid" do FactoryGirl.build(:charles_dickens, :email => '').should_not be_valid end
   end
  end
  describe "lastname" do
   describe "nil" do
    it "returns invalid" do FactoryGirl.build(:charles_dickens, :lastname => nil).should_not be_valid end
   end
   describe "blank" do
    it "returns invalid" do FactoryGirl.build(:charles_dickens, :lastname => '').should_not be_valid end
   end
  end
  describe "firstname" do
   describe "nil" do
    it "returns invalid" do FactoryGirl.build(:charles_dickens, :firstname => nil).should_not be_valid end
   end
   describe "blank" do
    it "returns invalid" do FactoryGirl.build(:charles_dickens, :firstname => '').should_not be_valid end
   end
  end
 end

 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, Customer.new) }
    it { should be_able_to(:update, Customer.new) }
    it { should be_able_to(:create, Customer.new) }
    it { should be_able_to(:destroy, Customer.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, Customer.new) }
    it { should be_able_to(:update, Customer.new) }
    it { should be_able_to(:create, Customer.new) }
    it { should be_able_to(:destroy, Customer.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, Customer.new) }
    it { should_not be_able_to(:update, Customer.new) }
    it { should_not be_able_to(:create, Customer.new) }
    it { should_not be_able_to(:destroy, Customer.new) }
   end
 end
end

# == Schema Information
#
# Table name: customers
#
#  id          :integer          not null, primary key
#  firstname   :string(255)      not null
#  lastname    :string(255)      not null
#  email       :string(255)      not null
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :integer          not null
#  updated_by  :integer          not null
#

