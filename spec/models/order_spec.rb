require 'spec_helper'

describe Order do
 subject { FactoryGirl.create(:order) }
 its(:purchase_date) { should == Date.today }
 its(:purchase_amount) { should == 2500 }
 its(:ispaid) { should be_false }
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
