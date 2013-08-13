require 'spec_helper'
require 'cancan/matchers'

describe FabricHandler do                            
  describe "normally" do
    before do
      user = double('user', :username => 'joel')
      fabric = double('fabric', :prices => double('array', :each => double('sss')))                        
      amount = '1.99'
      date = Date.today.strftime('%m/%d/%Y')
      @fh = FabricHandler.new fabric, user, amount, date
    end
    it "should have valid fabric price" do
      @fh.amount.should == 199
    end
    it "should have valid date" do 
      @fh.date.should == Date.today
    end
    it "should have valid user" do
      @fh.user.username.should == 'joel'
    end   
  end  
end