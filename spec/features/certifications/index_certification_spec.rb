require 'rails_helper'

feature "certification index" do
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  feature 'when logged in' do
    scenario "with certifications" do
     client = create(:client)
    assessee = create(:completed_training, client: client)
    assessment = create(:assessment, assessee: assessee)
    certification = create(:national_certificate, number: "000", certified: assessment)
      visit certifications_path

      expect(page).to have_content(certification.number)
    end

    scenario "without certifications" do
      visit certifications_path

      expect(page).to have_content("No certifications found")
    end

    scenario "with search results" do
      client = create(:client)
    assessee = create(:completed_training, client: client)
    assessment = create(:assessment, assessee: assessee)
    
    certification = create(:national_certificate, number: "000", certified: assessment)
    certification_2 = create(:national_certificate, number: "001", certified: assessment)
      visit certifications_path
      fill_in 'certification-search-form', with: certification.number
      click_button 'certification-search-btn'

      expect(page).to have_content("000")
      expect(page).to_not have_content("001")
    end
  end
end
