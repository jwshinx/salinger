require "spec_helper"
require 'cancan/matchers'

describe Product do
 describe "red solid" do
  let(:length) { FactoryGirl.create(:red_solid).fabrics.length }
  let(:fabric_name) { FactoryGirl.create(:red_solid).fabrics.first.name }
  it "has one fabric" do length.should == 1 end 
  it "has fabric red-cotton" do fabric_name.should == 'red cotton' end 
 end

 describe "when perfect" do
  subject { FactoryGirl.create(:orange_argyle) }
  specify { subject.should be_valid } 
  its(:name) { should == 'orange argyle' }
  its(:name) { should_not be_blank }
  its(:description) { should == 'orange color with yellow, white print' }
  its(:description) { should_not be_blank }
  its(:price) { should == 1999 }
  its(:price) { should_not be_blank }
 end
 describe "when name" do
  it "is blank throws exception" do 
   expect { 
    FactoryGirl.create(:orange_argyle, :name => '') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/) 
  end
  it "is nil throws exception" do 
   expect { 
    FactoryGirl.create(:orange_argyle, :name => nil) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/) 
  end
 end
 describe "when description" do
  it "is blank throws exception" do 
   expect { 
    FactoryGirl.create(:orange_argyle, :description => '') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Description is too short/) 
  end
  it "is nil throws exception" do 
   expect { 
    FactoryGirl.create(:orange_argyle, :description => nil) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Description can't be blank/) 
  end
 end
 describe "when price" do
  it "is nil throws exception" do 
   expect { 
    FactoryGirl.create(:orange_argyle, :price => nil) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Price is not a number/) 
  end
  it "is not numeric throws exception" do 
   expect { 
    FactoryGirl.create(:orange_argyle, :price => 'sa') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Price is not a number/) 
  end
  it "is not greater than zero throws exception" do 
   expect { 
    FactoryGirl.create(:orange_argyle, :price => 0) 
   }.to raise_error(ActiveRecord::RecordInvalid, /Price must be greater than 0/) 
  end
 end
 describe "when non-numeric count" do
  it "throws exception" do 
   expect { 
    FactoryGirl.create(:orange_argyle, :count=> 'a') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Count is not a number/) 
  end
 end
 describe "when price doesn't look like dollars" do
  it "throws exception" do 
   pending
   expect { 
    FactoryGirl.create(:orange_argyle, :price => '1.018784278') 
   }.to raise_error(ActiveRecord::RecordInvalid, /Price xxx/) 
   a = FactoryGirl.create(:orange_argyle, :price => '888.000978') 
   puts "---> #{a.errors.inspect}"
  end
 end
 describe "privilege" do
  subject { my_ability }
  let(:my_ability) { Ability.new(@user) }
  describe "for admin" do
   before(:each) { @user = FactoryGirl.create(:admin_user) }
   it { should be_able_to(:read, Product.new) }
   it { should be_able_to(:update, Product.new) }
   it { should be_able_to(:create, Product.new) }
   it { should be_able_to(:destroy, Product.new) }
  end
  describe "for manager" do
   before(:each) { @user = FactoryGirl.create(:manager_user) }
   it { should be_able_to(:read, Product.new) }
   it { should be_able_to(:update, Product.new) }
   it { should be_able_to(:create, Product.new) }
   it { should be_able_to(:destroy, Product.new) }
  end
  describe "for all else" do
   before(:each) { @user = FactoryGirl.create(:member_user) }
   it { should_not be_able_to(:read, Product.new) }
   it { should_not be_able_to(:update, Product.new) }
   it { should_not be_able_to(:create, Product.new) }
   it { should_not be_able_to(:destroy, Product.new) }
  end
 end
end
