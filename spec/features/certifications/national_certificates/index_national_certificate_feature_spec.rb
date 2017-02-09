require 'rails_helper'

feature "national_certificate index" do
  feature 'when logged in' do
    scenario "with national_certificates" do
      national_certificate = create(:national_certificate, number: "00001")
      visit national_certificates_path

      expect(page).to have_content(national_certificate.number)
    end

    scenario "without national_certificates" do
      visit national_certificates_path

      expect(page).to have_content("No national certificates found")
    end

    scenario "with search results" do
      national_certificate = create(:national_certificate, number: "000")
      national_certificate2 = create(:national_certificate, number: "001")


      visit national_certificates_path
      fill_in 'national_certificate-search-form', with: national_certificate.number
      click_button 'search-btn'

      expect(page).to have_content("000")
      expect(page).to_not have_content("001")
    end
  end
end
