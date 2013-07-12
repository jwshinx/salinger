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
 describe "normally" do
  it "returns blurb" do                                                          
   fullname = "#{random_string} #{random_string}"
   @order.stub id: 1
   @order.stub customer: double(fullname: fullname)
   @order.blurb.should == "#{fullname}: Order ##{@order.id}  Amount: $#{@order.purchase_amount/100.0}  Date: #{@order.purchase_date.strftime('%m/%d/%Y')}"
  end
 end
 describe "with line items" do
  it "returns count" do
   line_item1 = mock_model OrderLineItem, id: 1 
   line_item2 = mock_model OrderLineItem, id: 2
   @order.line_items << line_item1 << line_item2
   @order.line_items.length == 2
  end
 end
 describe "privilege" do
   subject { my_ability }
   let(:my_ability) { Ability.new(@user) }
   describe "for admin" do
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, Order.new) }
    it { should be_able_to(:update, Order.new) }
    it { should be_able_to(:create, Order.new) }
    it { should be_able_to(:destroy, Order.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, Order.new) }
    it { should be_able_to(:update, Order.new) }
    it { should be_able_to(:create, Order.new) }
    it { should be_able_to(:destroy, Order.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, Order.new) }
    it { should_not be_able_to(:update, Order.new) }
    it { should_not be_able_to(:create, Order.new) }
    it { should_not be_able_to(:destroy, Order.new) }
   end
 end
end
