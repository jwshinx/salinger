require 'spec_helper'
require 'cancan/matchers'

describe Email do
 
 describe "mocking" do
  before do
   @email = Email.new 
   @text = random_email
   @email.content = @text 
  end
  describe "with double" do
   it "should return email" do
    @email.stub email_type: double(id: 2) 
    @email.content.should == @text 
   end
  end
  describe "with mock_model" do
   it "should return email" do
    type = mock_model EmailType, id: 2
    @email.email_type = type
    @email.content.should == @text 
   end
  end
 end
 describe "normally" do
  subject{ FactoryGirl.create(:valid_email) }
  its(:content) { should == 'one@yahoo.com' }
 end
 describe "when without creator" do
  subject{ FactoryGirl.create(:anonymous_email) }
  its(:content) { should == 'three@yahoo.com' }
 end
 describe "when no *at* symbol" do
  it "throws exception" do
   expect {
    FactoryGirl.create(:no_at_symbol_email) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Email must look like an email address/)
  end
 end
 describe "when gibberish" do
  it "throws exception" do
   expect {
    FactoryGirl.create(:gibberish_email) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Email must look like an email address/)
  end
 end
 describe "when whitespace" do
  it "throws exception" do
   expect {
    FactoryGirl.create(:whitespace_email) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Email must look like an email address/)
  end
 end
 describe "when blank" do
  it "throws exception" do
   expect {
    FactoryGirl.create(:blank_email) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Email must look like an email address/)
  end
 end
 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Email.new) }
   it { should be_able_to(:update, Email.new) }
   it { should be_able_to(:create, Email.new) }
   it { should be_able_to(:destroy, Email.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Email.new) }
   it { should_not be_able_to(:update, Email.new) }
   it { should be_able_to(:create, Email.new) }
   it { should_not be_able_to(:destroy, Email.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Email.new) }
   it { should_not be_able_to(:update, Email.new) }
   it { should_not be_able_to(:create, Email.new) }
   it { should_not be_able_to(:destroy, Email.new) }
  end
 end
end
