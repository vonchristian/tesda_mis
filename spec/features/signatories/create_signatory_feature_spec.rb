require 'rails_helper'

feature "signatory creation" do 
  before(:each) do 
    visit settings_signatories_path 
    click_link "New Signatory"
  end

  scenario 'with valid attributes' do 
    fill_in "First name", with: "Test Name"
    fill_in "Middle name", with: "Middle Name"
    fill_in "Last name", with: "LAst"
    fill_in "Designation", with: "Director General"
    fill_in "Term start date", with: Date.today.years_ago(2)
    fill_in "Term end date", with: Date.today

    click_button "Save Signatory"

    expect(page).to have_content "saved successfully"
  end 

  scenario "with invalid attributes" do 
    click_button "Save Signatory"

    expect(page).to have_content "can't be blank"
  end
end 
