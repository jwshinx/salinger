require 'spec_helper'
require 'cancan/matchers'

describe Note do

 shared_examples_for "customer owner" do
  it "is Mark Twain" do
   "#{subject.owner.firstname} #{subject.owner.lastname}".should == 'Mark Twain'
  end
 end

 describe "fyi" do
  subject { FactoryGirl.create(:customer_fyi) }
  its(:content) { should == 'remember to mark it' }
  it_should_behave_like "customer owner"
 end
 describe "todo" do
  subject { FactoryGirl.create(:customer_todo) }
  its(:content) { should == 'send him bill' }
  it_should_behave_like "customer owner"
 end
end
