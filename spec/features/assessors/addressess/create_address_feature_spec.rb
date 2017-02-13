require 'rails_helper'

feature 'Create address' do
  before(:each) do
    assessor = create(:assessor)
    region = create(:region, name: "CAR")
    province = create(:province, name: "Ifugao")
    municipality_or_city = create(:municipality_or_city, name: "Tinoc")
    barangay = create(:barangay, name: "Poblacion")
    visit assessors_path
    click_link assessor.full_name
    click_link "Add Address"
  end

  scenario 'with valid attributes' do
    select "CAR"
    select "Ifugao"
    select "Tinoc"
    select "Poblacion"
    fill_in "Street", with: 'Tupaan'
    click_button "Save Address"

    expect(page).to have_content('saved successfully')
  end

  scenario 'with invalid attributes' do
    click_button "Save Address"

    expect(page).to have_content("can't be blank")
  end
end
