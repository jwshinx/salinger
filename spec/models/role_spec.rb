require "spec_helper"

describe Role do
 describe "admin" do
  subject { FactoryGirl.create(:admin) }
  specify { subject.should be_valid } 
  its(:name) { should == 'admin' }
  its(:name) { should_not be_blank }
  its(:description) { should == 'superuser!' }
  its(:description) { should_not be_blank }
 end
 describe "when name" do
  it "is blank throws exception" do expect { FactoryGirl.create(:admin, :name => '') }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/) end
  it "is nil throws exception" do expect { FactoryGirl.create(:admin, :name => nil) }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/) end
 end
 describe "when description" do
  it "is blank throws exception" do expect { FactoryGirl.create(:admin, :description => '') }.to raise_error(ActiveRecord::RecordInvalid, /Description is too short/) end
  it "is nil throws exception" do expect { FactoryGirl.create(:admin, :description => nil) }.to raise_error(ActiveRecord::RecordInvalid, /Description can't be blank/) end
 end
end
