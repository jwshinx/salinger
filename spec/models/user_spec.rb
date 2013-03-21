require "spec_helper"

describe User do
 describe "admin joel" do
  before { @joel = FactoryGirl.create(:admin_user) }
  subject { @joel }
  specify { @joel.should be_valid } 
  its(:username) { should == 'joel' }
  its(:username) { should_not be_blank }
  its(:email) { should == 'joel@webpass.net' }
  its(:active) { should be_true }
  describe "role" do
   subject { @joel.role }
   its(:name) { should == 'admin' }
   its(:description) { should == 'superuser!' }
  end
 end
end
