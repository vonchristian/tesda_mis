require 'rails_helper'

feature 'Create accreditation' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    assessor = create(:assessor)
    qualification = create(:qualification, name: "CHS")
    visit assessors_path
    click_link assessor.full_name
    click_link "New Accreditation"
  end

  scenario 'with valid attributes' do
    select "CHS"
    fill_in "Number", with: "9090324"
    fill_in "Accreditation date", with: Date.today
    fill_in "Expiry date", with: Date.today.next_year(5)
    click_button "Save Accreditation"

    expect(page).to have_content('saved successfully')
  end

  scenario 'with invalid attributes' do
    click_button "Save Accreditation"

    expect(page).to have_content("can't be blank")
  end
end
