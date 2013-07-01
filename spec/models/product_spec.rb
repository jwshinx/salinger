require "spec_helper"
require 'cancan/matchers'

describe Product do
 describe "normally" do
  before do 
   @product = Product.new({created_by: 1, updated_by:1}) 
   @name = random_string
   @product.name = @name
   @description = random_string
   @product.description = @description
   @count = random_number
   @product.count = @count
   @price = random_number
   @product.price = @price
  end
  subject { @product }
  specify { subject.should be_valid } 
  its(:description) { should == @description }
  its(:count) { should == @count.to_i }
  its(:price) { should == @price.to_i }
  describe "when name" do
   it "is blank throws exception" do 
    @product.name = '' 
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Name is too short/) 
   end
   it "is nil throws exception" do 
    @product.name = nil 
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/) 
   end
  end
  describe "when description" do
   it "is blank throws exception" do 
    @product.description = '' 
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Description is too short/) 
   end
   it "is nil throws exception" do 
    @product.description = nil 
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Description can't be blank/) 
   end
  end
  describe "when price" do
   it "is nil throws exception" do 
    @product.price = nil 
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Price is not a number/) 
   end
   it "is not numeric throws exception" do 
    @product.price = random_string 
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Price is not a number/) 
   end
   it "is not greater than zero throws exception" do 
    @product.price = 0 
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Price must be greater than 0/) 
   end
  end
  describe "when non-numeric count" do
   it "throws exception" do 
    @product.count = random_string 
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Count is not a number/) 
   end
  end
  describe "when price doesn't look like dollars" do
   it "throws exception" do 
    pending
    @product.price = 1.8989898
    expect { 
     @product.save!
    }.to raise_error(ActiveRecord::RecordInvalid, /Price xxx/) 
   end
  end
  describe "with fabrics" do
   it "returns count" do
    fabric1 = mock_model Fabric, name: 'red'
    fabric2 = mock_model Fabric, name: 'blue'
    @product.fabrics << fabric1 << fabric2
    @product.fabrics.length.should == 2 
    @product.fabrics.map{|f| f.name}.include?('red').should be_true 
    @product.fabrics.map{|f| f.name}.include?('blue').should be_true 
   end
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
