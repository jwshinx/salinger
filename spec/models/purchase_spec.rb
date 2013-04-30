require 'spec_helper'
#require 'cancan/matchers'
require 'example_helper'

describe Purchase do 
 include ExampleHelper
 describe "when perfect" do
  before do
   @admin = FactoryGirl.create(:admin_user)
   @p = Purchase.new valid_purchase_params, @admin
  end
  describe "*customer*" do
   describe "name" do
    it "returns Miles Davis" do
     @p.customer.should be_instance_of Customer
     @p.customer.firstname.should =~ /Miles/
     @p.customer.lastname.should =~ /Davis/
    end
   end
   describe "email" do
    it "should be MilesDavisxxx@yahoo.com" do
     @p.customer.email.should =~ /MilesDavis.+@yahoo.com$/
    end
   end
   describe "description" do
    it "returns *first customer*" do
     @p.customer.description.should == "first customer"
    end
   end
  end
  describe "*todos*" do
   it "returns one todo" do
    @p.customer.todos.length.should == 1
    @p.customer.todos[0].should be_instance_of Todo
   end
   it "returns content 'send receipt'" do 
    @p.customer.todos[0].content.should == 'send receipt' 
   end
  end
  describe "*fyis*" do
   it "returns one fyi" do
    @p.customer.fyis.length.should == 1
    @p.customer.fyis[0].should be_instance_of Fyi 
   end
   it "returns content 'he is cool'" do 
    @p.customer.fyis[0].content.should == 'he is cool' 
   end
  end
  describe "*orders*" do
   it "returns one fyi" do
    #@p.customer.orders.length.should == 1
    @p.customer.orders.first.purchase_date.should == Date.today
    @p.customer.orders.first.paid_amount.should == 8000
    @p.customer.orders.first.line_items.length.should == 1
    @p.customer.orders.first.line_items.first.product.name.should == 'orange argyle'
    @p.customer.orders.first.line_items.first.quantity.should == 4
   end
  end
 end
end

=begin
describe Address do

 describe "when perfect" do
  subject { FactoryGirl.create(:el_cerrito_address) }
  specify { subject.should be_valid }
  its(:street) { should == '2000 San Pablo Blvd' }
  its(:suite) { should == '#1500' }
  its(:city) { should == 'El Cerrito' }
  its(:state) { should == 'CA' }
  its(:zip) { should == '95555' }
 end
 describe "when street" do
  it "is blank throws exception" do
   expect {
    FactoryGirl.create(:address, :street => '')
   }.to raise_error(ActiveRecord::RecordInvalid, /Street is too short/)
  end
  it "is nil throws exception" do
   expect {
    FactoryGirl.create(:address, :street=> nil)
   }.to raise_error(ActiveRecord::RecordInvalid, /Street can't be blank/)
  end
 end

 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Address.new) }
   it { should be_able_to(:update, Address.new) }
   it { should be_able_to(:create, Address.new) }
   it { should be_able_to(:destroy, Address.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Address.new) }
   it { should be_able_to(:update, Address.new) }
   it { should be_able_to(:create, Address.new) }
   it { should be_able_to(:destroy, Address.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Address.new) }
   it { should_not be_able_to(:update, Address.new) }
   it { should_not be_able_to(:create, Address.new) }
   it { should_not be_able_to(:destroy, Address.new) }
  end
 end

end
=end
