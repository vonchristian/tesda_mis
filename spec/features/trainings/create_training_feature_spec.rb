require 'rails_helper'

feature "Create training" do
  scenario "with valid attributes" do
    visit trainings_path
    click_link "New Training"
    competency = create(:competency, unit_title: "Training Day")
    select "Training Day"
    click_button "Create Training"

    expect(page).to have_content('created successfully')
  end
end
