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

end
