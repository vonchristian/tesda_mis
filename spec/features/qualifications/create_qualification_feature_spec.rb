require 'rails_helper'

feature "Create qualification" do
  scenario "with valid attributes" do
    visit qualifications_path
    click_link "New Qualification"
    fill_in "Name", with: "CSS NC II"
    click_button "Create Qualification"

    expect(page).to have_content('created successfully')
  end
end 
