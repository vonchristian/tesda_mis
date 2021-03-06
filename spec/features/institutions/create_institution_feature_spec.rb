require 'rails_helper'

feature "Institution creation" do 
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  scenario 'with valid attributes' do 
    visit institutions_path 
    click_link "New Institution"
    fill_in "Name", with: "Test Name"
    attach_file("Upload Logo", Rails.root + "spec/support/logos/default_logo.png")
    click_button "Save Institution"

    expect(page).to have_content "saved successfully"
  end 
end 
