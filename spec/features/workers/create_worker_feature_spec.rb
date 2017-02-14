require 'rails_helper'

feature 'Create Client' do
  before(:each) do
    visit workers_path
    click_link "New Worker"
  end

  scenario 'with valid attributes' do
    fill_in "First name", with: 'Von'
    fill_in "Middle name", with: 'Pinosan'
    fill_in "Last name", with: 'Pinosan'
    choose 'Male'
    fill_in 'Date of birth', with: '02/12/1990'

    click_button "Save Worker"

    expect(page).to have_content('saved successfully')
  end

  scenario 'with invalid attributes' do
    click_button "Save Worker"

    expect(page).to have_content("can't be blank")
  end
end