require 'rails_helper'

feature "Create training" do
  scenario "with valid attributes" do
    certificate = create(:certificate)
    visit certificates_path
    click_link certificate.number
    click_link "New Issuance"
    fill_in "Serial number", with: "009232"
    fill_in "Application date", with: Date.today
    fill_in "Claim date", with: Date.today

    click_button "Issue Certificate"

    expect(page).to have_content('issued successfully')
  end
end
