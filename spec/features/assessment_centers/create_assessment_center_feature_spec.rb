require 'rails_helper'

feature "Create assessment center" do
  scenario "with valid attributes" do
    visit assessment_centers_path
    click_link "New Assessment Center"
    fill_in "Name", with: "TESDA PO"
    click_button "Save Assessment Center"

    expect(page).to have_content('saved successfully')
  end
end
