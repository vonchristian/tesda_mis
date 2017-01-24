require 'rails_helper'

feature "Create trainee" do
  scenario "with valid attributes" do
    educational_attainment = create(:educational_attainment, title: "TechVoc")
    visit trainees_path
    click_link "New Trainee"
    fill_in "First name", with: "Von"
    fill_in "Middle name", with: "Pinosan"
    fill_in "Last name", with: "Halip"
    choose "Male"
    fill_in "Date of birth", with: "09/02/1990"
    fill_in "Contact number", with: "09234567890"
    choose "TechVoc"

    click_button "Save Trainee"

    expect(page).to have_content('saved successfully')
  end
end
