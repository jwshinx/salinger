require 'spec_helper'
require 'cancan/matchers'

describe CustomerAddress do
 describe "normally" do
  before do
   @address = CustomerAddress.new()
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
  it "returns creator and updater" do
   username = "#{random_string}"
   @address.creator = mock_model(User, id: 1, username: username)
   @address.updater = mock_model(User, id: 1, username: username)
   @address.creator.username.should == username 
   @address.updater.username.should == username 
  end  
  
  
 end
 
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, CustomerAddress.new) }
    it { should be_able_to(:update, CustomerAddress.new) }
    it { should be_able_to(:create, CustomerAddress.new) }
    it { should be_able_to(:destroy, CustomerAddress.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, CustomerAddress.new) }
    it { should be_able_to(:update, CustomerAddress.new) }
    it { should be_able_to(:create, CustomerAddress.new) }
    it { should be_able_to(:destroy, CustomerAddress.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, CustomerAddress.new) }
    it { should_not be_able_to(:update, CustomerAddress.new) }
    it { should_not be_able_to(:create, CustomerAddress.new) }
    it { should_not be_able_to(:destroy, CustomerAddress.new) }
   end
 end
end

# == Schema Information
#
# Table name: customer_addresses
#
#  id              :integer          not null, primary key
#  customer_id     :integer          not null
#  address_type_id :integer          not null
#  name            :string(255)
#  line_one        :string(255)      not null
#  line_two        :string(255)
#  suite           :string(255)
#  city            :string(255)      not null
#  state           :string(255)      not null
#  zip             :string(255)      not null
#  updated_by      :integer          not null
#  created_by      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

