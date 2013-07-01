require 'acceptance/acceptance_helper'

feature 'Fabric feature', %q{
  In order to manage fabrics 
  As an authenticated user 
  I want to list, create, update, destroy devices
} do

  before(:each) do
    user = create_admin_user
    Fabric.create({name: 'Black', created_by: user.id, updated_by: user.id})
  end

  scenario 'list fabrics' do
    log_in
    visit "/fabrics"
    page.should have_content("Fabrics")
    page.should have_content("Black")
  end
end
