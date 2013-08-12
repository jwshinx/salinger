require "spec_helper"
require 'cancan/matchers'

describe Product do
 describe "normally" do
  before do 
   #@product = Product.new({created_by: 1, updated_by:1}) 
   @product = Product.new
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
  it "returns array of fyis" do
    @product.string_array_of_fyis.should be_instance_of Array
  end 
  it "returns array of todos" do
    @product.string_array_of_todos.should be_instance_of Array
  end  
  it "returns creator and updater" do
   username = "#{random_string}"
   @product.creator = mock_model(User, id: 1, username: username)
   @product.updater = mock_model(User, id: 1, username: username)
   @product.creator.username.should == username 
   @product.updater.username.should == username 
  end                                                          
  it "returns blurb of name/description/price/count" do                                    
   @product.stub name: 'Green', description: 'Bright', price: 4999, count: 10
   @product.blurb.should == 'Green - Bright: $49.99, Count: 10'
  end
  it "returns to_s of name/description/price/count" do                                    
   @product.stub name: 'Green', description: 'Bright', price: 4999, count: 10
   @product.to_s.should == 'Green - Bright: $49.99, Count: 10'
  end
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
    before(:each) { @user = mock_model User, admin?: true }
    it { should be_able_to(:read, Product.new) }
    it { should be_able_to(:update, Product.new) }
    it { should be_able_to(:create, Product.new) }
    it { should be_able_to(:destroy, Product.new) }
   end
   describe "for manager" do
    before(:each) { @user = mock_model User, manager?: true, admin?: false }
    it { should be_able_to(:read, Product.new) }
    it { should be_able_to(:update, Product.new) }
    it { should be_able_to(:create, Product.new) }
    it { should be_able_to(:destroy, Product.new) }
   end
   describe "for all else" do
    before(:each) { @user = mock_model User, manager?: false, admin?: false }
    it { should_not be_able_to(:read, Product.new) }
    it { should_not be_able_to(:update, Product.new) }
    it { should_not be_able_to(:create, Product.new) }
    it { should_not be_able_to(:destroy, Product.new) }
   end
 end 
end

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text             default(""), not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :integer          not null
#  updated_by  :integer          not null
#  count       :integer          not null
#

