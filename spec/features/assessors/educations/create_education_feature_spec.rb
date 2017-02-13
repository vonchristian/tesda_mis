require 'rails_helper'

feature 'Create education' do
  before(:each) do
    assessor = create(:assessor)
    educational_attainment = create(:educational_attainment, name: "High School Graduate")
    visit assessors_path
    click_link assessor.full_name
    click_link "Add Education"
  end

  scenario 'with valid attributes' do
    choose "High School Graduate"
    click_button "Save Education"

    expect(page).to have_content('saved successfully')
  end

  scenario 'with invalid attributes' do
    click_button "Save Education"

    expect(page).to have_content("can't be blank")
  end
end
