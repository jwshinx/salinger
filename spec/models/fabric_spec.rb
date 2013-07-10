require "spec_helper"
require 'cancan/matchers'

describe Fabric do
 describe "normally" do
  before do
   @fabric = Fabric.new({created_by: 1, updated_by: 1})
   @name = random_string; @fabric.name = @name
  end
  subject { @fabric }
  specify { subject.should be_valid } 
  its(:name) { should == @name }
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
