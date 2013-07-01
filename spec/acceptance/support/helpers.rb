module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.
  def log_in
    visit "/login"
    fill_in "Username", :with => "joel"
    fill_in "Password", :with => "password"
    click_button "Login"
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance
