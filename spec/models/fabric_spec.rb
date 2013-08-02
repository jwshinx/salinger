require "spec_helper"
require 'cancan/matchers'

describe Fabric do
 describe "normally" do
  before do
   @fabric = Fabric.new
   @name = random_string; @fabric.name = @name
  end
  subject { @fabric }
  specify { subject.should be_valid } 
  its(:name) { should == @name }   

  it "returns creator and updater" do
   username = "#{random_string}"
   @fabric.creator = mock_model(User, id: 1, username: username)
   @fabric.updater = mock_model(User, id: 1, username: username)
   @fabric.creator.username.should == username 
   @fabric.updater.username.should == username 
  end  
  
  describe "with blank name" do
   its "returns error" do
    @fabric.name = ''
    expect {
     @fabric.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/) 
   end
  end
  describe "with nil name" do
   its "returns error" do
    @fabric.name = nil 
    expect {
     @fabric.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/) 
   end
  end
 end

 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, Fabric.new) }
    it { should be_able_to(:update, Fabric.new) }
    it { should be_able_to(:create, Fabric.new) }
    it { should be_able_to(:destroy, Fabric.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, Fabric.new) }
    it { should be_able_to(:update, Fabric.new) }
    it { should be_able_to(:create, Fabric.new) }
    it { should be_able_to(:destroy, Fabric.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, Fabric.new) }
    it { should_not be_able_to(:update, Fabric.new) }
    it { should_not be_able_to(:create, Fabric.new) }
    it { should_not be_able_to(:destroy, Fabric.new) }
   end
 end
end

# == Schema Information
#
# Table name: fabrics
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  created_by :integer          not null
#  updated_by :integer          not null
#

