require 'spec_helper'
require 'cancan/matchers'

describe Farm do
 describe "xxx when perfect" do
   before do
     @name = random_string
     @street = random_string
     @address = mock_model Address, id: random_number, street: @street
     @farm = Farm.new
     @farm.address = @address
   end   
   it "returns name" do
     @farm.name = @name
     @farm.name.should == @name
   end
   it "returns address street" do
     @farm.address.street.should == @street
   end   
   it "returns creator and updater" do
    username = "#{random_string}"
    @farm.creator = mock_model(User, id: 1, username: username)
    @farm.updater = mock_model(User, id: 1, username: username)
    @farm.creator.username.should == username 
    @farm.updater.username.should == username 
   end    
 end
 describe "when perfect" do
  subject { FactoryGirl.build(:michaels_farm) }
  specify { subject.should be_valid }
  its(:name) { should == 'Michaels' }
  its "returns street 1500 MLK Blvd" do 
   subject.address.street.should == '1500 MLK Blvd'
  end
  its "returns suite #1500" do 
   subject.address.suite.should == '#1500'
  end
  its "returns city Berkeley" do 
   subject.address.city.should == 'Berkeley'
  end
  its "returns state CA" do 
   subject.address.state.should == 'CA'
  end
  its "returns zip 94005" do 
   subject.address.zip.should == '94005'
  end
 end
 describe "when name" do
  it "is blank is not valid" do
    FactoryGirl.build(:michaels_farm, :name => '').should_not be_valid    
  end
  it "is nil is not valid" do
   FactoryGirl.build(:michaels_farm, :name => nil).should_not be_valid    
  end
 end
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, Farm.new) }
    it { should be_able_to(:update, Farm.new) }
    it { should be_able_to(:create, Farm.new) }
    it { should be_able_to(:destroy, Farm.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, Farm.new) }
    it { should be_able_to(:update, Farm.new) }
    it { should be_able_to(:create, Farm.new) }
    it { should be_able_to(:destroy, Farm.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, Farm.new) }
    it { should_not be_able_to(:update, Farm.new) }
    it { should_not be_able_to(:create, Farm.new) }
    it { should_not be_able_to(:destroy, Farm.new) }
   end
 end
end
