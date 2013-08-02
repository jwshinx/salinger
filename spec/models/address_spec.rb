require 'spec_helper'
require 'cancan/matchers'

describe Address do
 describe "normally" do
  before do
   #@address = Address.new( { created_by: 1, updated_by: 1 } )
   @address = Address.new

   @street = random_street_address
   @suite = random_number
   @city = random_string
   @state = random_string
   @zip = random_5_digit_number
   @address.street = @street
   @address.suite = @suite
   @address.city = @city
   @address.state = @state
   @address.zip = @zip
  end
  subject { @address }
  its(:street) { should == @street }
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
  describe "when street" do
   it "is blank throws exception" do
    @address.street = '' 
    expect {
     @address.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Street is too short/)
   end
   it "is nil throws exception" do
    @address.street = nil
    expect {
     @address.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Street can't be blank/)
   end
  end
 end
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, Address.new) }
    it { should be_able_to(:update, Address.new) }
    it { should be_able_to(:create, Address.new) }
    it { should be_able_to(:destroy, Address.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, Address.new) }
    it { should be_able_to(:update, Address.new) }
    it { should be_able_to(:create, Address.new) }
    it { should be_able_to(:destroy, Address.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, Address.new) }
    it { should_not be_able_to(:update, Address.new) }
    it { should_not be_able_to(:create, Address.new) }
    it { should_not be_able_to(:destroy, Address.new) }
   end
 end
end

# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string(255)      not null
#  suite      :string(255)
#  city       :string(255)      not null
#  state      :string(255)      not null
#  zip        :string(255)      not null
#  updated_by :integer          not null
#  created_by :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

