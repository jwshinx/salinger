require "spec_helper"

describe Product do

 describe "when perfect" do
  subject { FactoryGirl.create(:orange_argyle) }
  specify { subject.should be_valid } 
  its(:name) { should == 'orange argyle' }
  its(:name) { should_not be_blank }
  its(:description) { should == 'orange color with yellow, white print' }
  its(:description) { should_not be_blank }
  its(:price) { should == 39.99 }
  its(:price) { should_not be_blank }
 end
 describe "name = ''" do
  it "should throw exception" do
   expect {
    FactoryGirl.create(:orange_argyle, :name => '') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/)
  end
 end
 describe "name = nil" do
  it "should throw exception" do
   expect {
    FactoryGirl.create(:orange_argyle, :name => nil) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/)
  end
 end

end
