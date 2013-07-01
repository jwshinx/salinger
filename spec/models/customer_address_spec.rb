require 'spec_helper'
require 'cancan/matchers'

describe CustomerAddress do
 describe "normally" do
  before do
   @address = CustomerAddress.new( {created_by: 1, updated_by: 1})
   @home = random_string
   @line_one = random_street_address
   @line_two = random_string
   @suite = random_number
   @city = random_string
   @state = random_string
   @zip = random_5_digit_number
   @address.name = @home
   @address.line_one = @line_one
   @address.line_two = @line_two
   @address.suite = @suite
   @address.city = @city
   @address.state = @state
   @address.zip = @zip
   @address.stub customer: double(id: 1)
   @address.stub type: double(id: 1)
  end
  subject { @address }
  specify { subject.should be_valid }
  its(:name) { should == @home }
  its(:line_one) { should == @line_one }
  its(:line_two) { should == @line_two }
  its(:suite) { should == @suite }
  its(:city) { should == @city }
  its(:state) { should == @state }
  its(:zip) { should == @zip }
  its(:created_by) { should == 1 }
  its(:updated_by) { should == 1 }
 end
 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, CustomerAddress.new) }
   it { should be_able_to(:update, CustomerAddress.new) }
   it { should be_able_to(:create, CustomerAddress.new) }
   it { should be_able_to(:destroy, CustomerAddress.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, CustomerAddress.new) }
   it { should be_able_to(:update, CustomerAddress.new) }
   it { should be_able_to(:create, CustomerAddress.new) }
   it { should be_able_to(:destroy, CustomerAddress.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, CustomerAddress.new) }
   it { should_not be_able_to(:update, CustomerAddress.new) }
   it { should_not be_able_to(:create, CustomerAddress.new) }
   it { should_not be_able_to(:destroy, CustomerAddress.new) }
  end
 end

end
