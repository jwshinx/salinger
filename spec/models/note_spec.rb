require 'spec_helper'
require 'cancan/matchers'

describe Note do
 describe "fyi" do
  subject { FactoryGirl.create(:customer_fyi) }
  its(:content) { should == 'remember to mark it' }
  it "belongs to customer mark twain" do
   "#{subject.owner.firstname} #{subject.owner.lastname}".should == 'Mark Twain'
  end
 end
 describe "todo" do
  subject { FactoryGirl.create(:customer_todo) }
  its(:content) { should == 'send him bill' }
  it "belongs to customer mark twain" do
   "#{subject.owner.firstname} #{subject.owner.lastname}".should == 'Mark Twain'
  end
 end
end
