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

# == Schema Information
#
# Table name: retailers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  address_id :integer          not null
#  phone      :string(255)
#  contact    :string(255)
#  updated_by :integer          not null
#  created_by :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

