require 'spec_helper'
#require 'cancan/matchers'

def valid_purchase_params
 orange_argyle = FactoryGirl.create(:orange_argyle)
 random = Random.rand(5 ** 5)
 {
  :customer=>{:firstname=>"Miles#{random}", :lastname=>"Davis#{random}", :email=>"md#{random}@yahoo.com", 
   :description=>"dkf", 
   :todos_attributes=>{
    "0"=>{:content=>"send receipt"}
   }, 
   :fyis_attributes=>{
    "0"=>{:content=>"he is cool"}
   }, 
   :orders_attributes=>{
    "0"=>{"purchase_date(1i)"=>"2013", "purchase_date(2i)"=>"4", "purchase_date(3i)"=>"27", :paid_amount=>"8000", 
     :line_items_attributes=>{
      "0"=>{:product_id=>orange_argyle.id, :quantity=>"4"}
     }
    }
   }
  }
 }
end

describe Purchase do 
 describe "when perfect" do
  before do
   @admin = FactoryGirl.create(:admin_user)
   @p = Purchase.new valid_purchase_params, @admin
  end
  it "xxx" do
   @p.should be_true
  end
  it "dkdk" do
   @p.to_s.should == 'purchase'
  end
  it "one" do
   @p.customer.should be_instance_of Customer
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
