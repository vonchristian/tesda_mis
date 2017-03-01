require 'rails_helper'

feature "Create Certificate Revision" do 
  before(:each) do 
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    
    visit settings_certificate_revisions_path 
    click_link "New Revision"
  end

  scenario 'with valid attributes' do 
    fill_in "Revision date", with: Date.today
    click_button "Save Revision"

    expect(page).to have_content "saved successfully"
  end 

  scenario "with invalid attributes" do 
    click_button "Save Revision"

    expect(page).to have_content "can't be blank"
  end
end 
