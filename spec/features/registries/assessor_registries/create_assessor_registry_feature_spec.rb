require 'rails_helper'

feature 'Create registry' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  
    visit assessor_registries_path
    click_link "Upload Registry"
  end

  scenario 'with valid attributes' do
    registry = create(:assessor_registry)
    attach_file("Upload Spreadsheet", Rails.root + "spec/support/spreadsheets/test_rwac.xls")
    fill_in "Name", with: 'RWAC IFSU Lagawe'

    click_button "Upload Registry"

    expect(page).to have_content('uploaded successfully')
  end

  scenario 'with invalid attributes' do
    click_button "Upload Registry"

    expect(page).to have_content("can't be blank")
  end
end
