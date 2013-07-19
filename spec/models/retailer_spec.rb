require 'spec_helper'

describe Retailer do
  it "returns creator and updater" do
   @retailer = Retailer.new
   username = "#{random_string}"
   @retailer.creator = mock_model(User, id: 1, username: username)
   @retailer.updater = mock_model(User, id: 1, username: username)
   @retailer.creator.username.should == username 
   @retailer.updater.username.should == username 
  end
end
