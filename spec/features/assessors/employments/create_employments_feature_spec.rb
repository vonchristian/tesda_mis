require 'rails_helper'

feature 'Create employment' do
  before(:each) do
    assessor = create(:assessor)
    company = create(:company, name: "TESDA")
    visit assessors_path
    click_link assessor.full_name
    click_link "Add Employment"
  end

  scenario 'with valid attributes' do
    fill_in "Designation", with: "Trainer I"
    select "TESDA"
    click_button "Save Employment"

    expect(page).to have_content('saved successfully')
  end

  scenario 'with invalid attributes' do
    click_button "Save Employment"

    expect(page).to have_content("can't be blank")
  end
end
