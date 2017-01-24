require 'rails_helper'

feature "Create competency" do
  scenario "with valid attributes" do
    qualification = create(:qualification)
    visit qualification_path(qualification)
    click_link "New Competency"
    fill_in "Unit code", with: "ME3423432"
    fill_in "Unit title", with: "Setup computers and systems"

    click_button "Create Competency"

    expect(page).to have_content('created successfully')
  end
end
