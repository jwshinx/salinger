require 'spec_helper'
require 'cancan/matchers'

describe AddressType do
 
 describe "normally" do
  before do
   @type = AddressType.new
   @name = random_string
   @description = random_string
   @type.name = @name
   @type.description = @description
  end
  subject { @type }
  its(:name) { should == @name }
  its(:description) { should == @description } 
  it "returns creator and updater" do
   username = "#{random_string}"
   @type.creator = mock_model(User, id: 1, username: username)
   @type.updater = mock_model(User, id: 1, username: username)
   @type.creator.username.should == username 
   @type.updater.username.should == username 
  end  
 end

 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, AddressType.new) }
    it { should be_able_to(:update, AddressType.new) }
    it { should be_able_to(:create, AddressType.new) }
    it { should be_able_to(:destroy, AddressType.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, AddressType.new) }
    it { should be_able_to(:update, AddressType.new) }
    it { should be_able_to(:create, AddressType.new) }
    it { should be_able_to(:destroy, AddressType.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, AddressType.new) }
    it { should_not be_able_to(:update, AddressType.new) }
    it { should_not be_able_to(:create, AddressType.new) }
    it { should_not be_able_to(:destroy, AddressType.new) }
   end
 end
end

# == Schema Information
#
# Table name: address_types
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)
#  created_by  :integer          not null
#  updated_by  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

