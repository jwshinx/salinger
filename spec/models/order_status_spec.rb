require 'spec_helper'
require 'cancan/matchers'

describe OrderStatus do
 describe "normally" do
  before do
   @status = OrderStatus.new
   @title = random_string 
   @description = random_string
   @status.title = @title
   @status.description = @description 
  end
  subject { @status }
  its(:title) { should == @title }
  its(:description) { should == @description } 
  it "returns creator and updater" do
   username = "#{random_string}"
   @status.creator = mock_model(User, id: 1, username: username)
   @status.updater = mock_model(User, id: 1, username: username)
   @status.creator.username.should == username 
   @status.updater.username.should == username 
  end  
 end
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, OrderStatus.new) }
    it { should be_able_to(:update, OrderStatus.new) }
    it { should be_able_to(:create, OrderStatus.new) }
    it { should be_able_to(:destroy, OrderStatus.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, OrderStatus.new) }
    it { should be_able_to(:update, OrderStatus.new) }
    it { should be_able_to(:create, OrderStatus.new) }
    it { should_not be_able_to(:destroy, OrderStatus.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, OrderStatus.new) }
    it { should_not be_able_to(:update, OrderStatus.new) }
    it { should_not be_able_to(:create, OrderStatus.new) }
    it { should_not be_able_to(:destroy, OrderStatus.new) }
   end
 end
end
