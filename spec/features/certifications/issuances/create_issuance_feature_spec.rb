require 'rails_helper'

feature "Issue certificate" do
  before(:each) do 
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    
    client = create(:client)
    assessee = create(:completed_training, client: client)
    assessment = create(:assessment, assessee: assessee)
    certification = create(:national_certificate, number: "000", certified: assessment, client: client)
    visit national_certificates_path
    click_link certification.number
    expect(page).to have_content(certification.number)
    
    click_link "New Issue" 
  end

  scenario 'with valid attributes' do
    fill_in "CLN Number", with: "009-0092"
    fill_in "Date Claimed", with: Date.today
    click_button "Issue Certificate"
    expect(page).to have_content("issued successfully.")
  end

  scenario "with invalid attributes" do 
    click_button "Issue Certificate"

    expect(page).to have_content("can't be blank")
  end
end
