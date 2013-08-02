require "spec_helper"
require 'cancan/matchers'

describe User do
 describe "admin joel" do
  #before { @joel = mock_model User, admin?: true }
  before { @joel = FactoryGirl.create(:admin_user, username: "joel#{random_string}", email: "j#{random_string}@yahkdi.com") }
  subject { @joel }
  specify { @joel.should be_valid } 
  its(:username) { should =~ /joel\w+/}
  its(:username) { should_not be_blank }
  its(:email) { should =~ /j\w+@yahkdi.com/ }
  its(:active) { should be_true }
  it "returns creator and updater" do
   username = "#{random_string}"
   @joel.creator = mock_model(User, id: 1, username: username)
   @joel.updater = mock_model(User, id: 1, username: username)
   @joel.creator.username.should == username 
   @joel.updater.username.should == username 
  end 
  describe "role" do
   subject { @joel.role }
   its(:name) { should == 'admin' }
   its(:description) { should == 'superuser!' }
  end
 end
 describe "normally can retrieve" do           
   before { @user = User.new }
   subject { @user }
   its(:created_products) { should be_instance_of Array }
   its(:updated_products) { should be_instance_of Array }
   its(:created_fabrics) { should be_instance_of Array }
   its(:updated_fabrics) { should be_instance_of Array }
   its(:created_sewings) { should be_instance_of Array }
   its(:updated_sewings) { should be_instance_of Array }
   its(:created_customers) { should be_instance_of Array }
   its(:updated_customers) { should be_instance_of Array }
   its(:updated_customers) { should be_instance_of Array }
   its(:created_emails) { should be_instance_of Array }
   its(:updated_emails) { should be_instance_of Array }
   its(:created_email_types) { should be_instance_of Array }
   its(:updated_email_types) { should be_instance_of Array }
   its(:created_task_status_types) { should be_instance_of Array }
   its(:updated_task_status_types) { should be_instance_of Array }
   its(:created_order_statuses) { should be_instance_of Array }
   its(:updated_order_statuses) { should be_instance_of Array }
   its(:created_address_types) { should be_instance_of Array }
   its(:updated_address_types) { should be_instance_of Array }
   its(:created_customer_addresses) { should be_instance_of Array }
   its(:updated_customer_addresses) { should be_instance_of Array }
   its(:created_fyis) { should be_instance_of Array }
   its(:updated_fyis) { should be_instance_of Array }
   its(:created_todos) { should be_instance_of Array }
   its(:updated_todos) { should be_instance_of Array }
 end

 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = mock_model User, admin?: true }
   it { should be_able_to(:read, User.new) }
   it { should be_able_to(:update, User.new) }
   it { should be_able_to(:create, User.new) }
   it { should be_able_to(:destroy, User.new) }
  end
  describe "for manager" do
   before(:each) { @user = mock_model User, manager?: true, admin?: false }
   it { should_not be_able_to(:read, User.new) }
   it { should_not be_able_to(:update, User.new) }
   it { should_not be_able_to(:create, User.new) }
   it { should_not be_able_to(:destroy, User.new) }
   it "should be able to update own information" do
    my_ability.should be_able_to(:update, @user) 
   end
  end
  describe "for all else" do
   before(:each) { @user = mock_model User, manager?: false, admin?: false }
   it { should_not be_able_to(:read, User.new) }
   it { should_not be_able_to(:update, User.new) }
   it { should_not be_able_to(:create, User.new) }
   it { should_not be_able_to(:destroy, User.new) }
  end
 end
end

# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  username          :string(255)      not null
#  email             :string(255)      not null
#  active            :boolean          default(TRUE), not null
#  role_id           :integer          not null
#  crypted_password  :string(255)      not null
#  password_salt     :string(255)      not null
#  persistence_token :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

