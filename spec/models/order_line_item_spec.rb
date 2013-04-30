require 'spec_helper'

describe OrderLineItem do
 subject { FactoryGirl.create(:lebron).orders.first.line_items.first }
 its(:quantity) { should == 1 }
 its(:price) { should == 2000 }
 its(:subtotal) { should == 2000 }
 it "returns creator" do
  subject.creator.username.should =~ /joel/
 end
 it "returns updater" do
  subject.updater.username.should =~ /joel/
 end

 describe "privileges" do
  it "admin" do
   pending
  end
  it "manager" do
   pending
  end
  it "member" do
   pending
  end
 end
end
