require 'spec_helper'

describe Sewing do
  it "returns creator and updater" do
   @sewing = Sewing.new
   username = "#{random_string}"
   @sewing.creator = mock_model(User, id: 1, username: username)
   @sewing.updater = mock_model(User, id: 1, username: username)
   @sewing.creator.username.should == username 
   @sewing.updater.username.should == username 
  end
end
