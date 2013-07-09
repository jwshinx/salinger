require 'spec_helper'
require 'cancan/matchers'

describe EmailType do
 describe "normally" do
  subject { FactoryGirl.create(:email_signup) }
  its(:name) { should == 'Email Signup' }
  its(:description) { should == 'signup for discounts' } 
 end 
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, EmailType.new) }
    it { should be_able_to(:update, EmailType.new) }
    it { should be_able_to(:create, EmailType.new) }
    it { should be_able_to(:destroy, EmailType.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, EmailType.new) }
    it { should_not be_able_to(:update, EmailType.new) }
    it { should_not be_able_to(:create, EmailType.new) }
    it { should_not be_able_to(:destroy, EmailType.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, EmailType.new) }
    it { should_not be_able_to(:update, EmailType.new) }
    it { should_not be_able_to(:create, EmailType.new) }
    it { should_not be_able_to(:destroy, EmailType.new) }
   end
 end
end
