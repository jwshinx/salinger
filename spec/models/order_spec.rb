require 'spec_helper'
require 'cancan/matchers'

describe Order do
 before do
  @order = Order.new
  @purchase_date = Date.today; @order.purchase_date = @purchase_date
  @purchase_amount = random_number; @order.purchase_amount = @purchase_amount
  @ispaid = false
 end
 subject { @order } 
 its(:purchase_date) { should == @purchase_date } 
 its(:purchase_amount) { should == @purchase_amount.to_i } 
 its(:ispaid) { should be_false }
 it "returns creator and updater" do
  username = "#{random_string}"
  @order.creator = mock_model(User, id: 1, username: username)
  @order.updater = mock_model(User, id: 1, username: username)
  @order.creator.username.should == username 
  @order.updater.username.should == username 
 end
        
 describe "normally" do  
  it "can return by-recent-purchase-date" do                                                                
    Order.by_recent_purchase_date.should == []                          
  end
  it "returns blurb" do                                                          
   fullname = "#{random_string} #{random_string}"
   @order.stub id: 1
   @order.stub customer: double(fullname: fullname)
   @order.blurb.should == "#{fullname}: Order ##{@order.id}  Amount: $#{@order.purchase_amount/100.0}  Date: #{@order.purchase_date.strftime('%m/%d/%Y')}"
  end
  it "reduces inventory" do                   
    #my_product = double('product', :count => 10, :count= => 8, :save => true)
    @order = Order.new
    my_product = double('product', :count => 10)   
    my_product.should_receive(:update_attribute).with(:count, 8)
    @order.should_receive(:line_items).and_return([double('invoice_line_item', :quantity => 2, :product => my_product)])
    @order.reduce_inventory.should be_true
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

# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  purchase_date   :date             not null
#  paid_date       :date
#  customer_id     :integer          not null
#  purchase_amount :integer          not null
#  paid_amount     :integer          default(0), not null
#  updated_by      :integer          not null
#  created_by      :integer          not null
#  ispaid          :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  order_status_id :integer          not null
#

