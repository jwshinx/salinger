require 'spec_helper'
require 'cancan/matchers'

describe ProductBuilder do                            
  describe "normally" do
    it "returns true" do  
      #@user = double('user', :username => 'joel', :id => 1)     
      @user = FactoryGirl.create(:admin_user)
      options = { :product => {:name => 'xxx', :price => '29.99'} }
      #@product = double('product', :user => @user)
      #@product.should_receive(:creator) # = @user 
      @pb = ProductBuilder.new options[:product], @user
      @pb.should be_true
    end
  end  
end