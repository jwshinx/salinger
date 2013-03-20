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
 describe "when name" do
  it "is blank throws exception" do expect { FactoryGirl.create(:orange_argyle, :name => '') }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/) end
  it "is nil throws exception" do expect { FactoryGirl.create(:orange_argyle, :name => nil) }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/) end
 end
 describe "when description" do
  it "is blank throws exception" do expect { FactoryGirl.create(:orange_argyle, :description => '') }.to raise_error(ActiveRecord::RecordInvalid, /Description is too short/) end
  it "is nil throws exception" do expect { FactoryGirl.create(:orange_argyle, :description => nil) }.to raise_error(ActiveRecord::RecordInvalid, /Description can't be blank/) end
 end
 describe "when price" do
  it "is nil throws exception" do expect { FactoryGirl.create(:orange_argyle, :price => nil) }.to raise_error(ActiveRecord::RecordInvalid, /Price can't be blank/) end
  it "is not numeric throws exception" do expect { FactoryGirl.create(:orange_argyle, :price => 'sa') }.to raise_error(ActiveRecord::RecordInvalid, /Price is not a number/) end
  it "is not greate than zero throws exception" do expect { FactoryGirl.create(:orange_argyle, :price => 0) }.to raise_error(ActiveRecord::RecordInvalid, /Price must be greater than 0/) end
 end
end
