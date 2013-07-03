require 'spec_helper'
require 'cancan/matchers'

describe Order do
 before do
  @order = Order.new( {created_by:1, updated_by:1}) 
  @purchase_date = Date.today; @order.purchase_date = @purchase_date
  @purchase_amount = random_number; @order.purchase_amount = @purchase_amount
  @ispaid = false
  #order_status_id
  #customer_id
 end
 subject { @order } 
 its(:purchase_date) { should == @purchase_date } 
 its(:purchase_amount) { should == @purchase_amount.to_i } 
 its(:ispaid) { should be_false }
 
 describe "with line items" do
  it "returns count" do
   line_item1 = mock_model OrderLineItem, id: 1 
   line_item2 = mock_model OrderLineItem, id: 2
   @order.line_items << line_item1 << line_item2
   @order.line_items.length == 2
  end
 end
 describe "when multiple " do
  before do 
   @order = mock_model Order, id: 1
   #@purchase_date = Date.today; @order.purchase_date = @purchase_date
   #@purchase_amount = random_number; @order.purchase_amount = @purchase_amount
   #@ispaid = false; @order.ispaid = @ispaid
   @order.stub customer_id: double(id: 1)
   @product1 = mock_model Product, id: 1 
   @product2 = mock_model Product, id: 2
   @line_item1 = mock_model OrderLineItem, id: 1
   @line_item2 = mock_model OrderLineItem, id: 2 
   @order.line_items << @line_item1 << @line_item2
  end
  it "slsl" do
   puts "---> 1 #{@order.inspect}"
  end
 end
 describe "privileges" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Order.new) }
   it { should be_able_to(:update, Order.new) }
   it { should be_able_to(:create, Order.new) }
   it { should be_able_to(:destroy, Order.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Order.new) }
   it { should be_able_to(:update, Order.new) }
   it { should be_able_to(:create, Order.new) }
   it { should be_able_to(:destroy, Order.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Order.new) }
   it { should_not be_able_to(:update, Order.new) }
   it { should_not be_able_to(:create, Order.new) }
   it { should_not be_able_to(:destroy, Order.new) }
  end

 end
end
