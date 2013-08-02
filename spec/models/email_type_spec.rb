require 'spec_helper'
require 'cancan/matchers'

describe EmailType do
 describe "normally" do
  #subject { FactoryGirl.create(:email_signup) }
  before do 
    @type = EmailType.new 
    @type.stub name: "Email Signup"
    @type.stub description: "signup for discounts"
  end
  subject { @type }
  its(:name) { should == 'Email Signup' }
  its(:description) { should == 'signup for discounts' } 
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

# == Schema Information
#
# Table name: email_types
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)
#  updated_by  :integer          not null
#  created_by  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

