require 'rails_helper'

feature "certification index" do
  feature 'when logged in' do
    scenario "with certifications" do
      certification = create(:certification, number: "00001")
      visit certifications_path

      expect(page).to have_content(certification.number)
    end

    scenario "without certifications" do
      visit certifications_path

      expect(page).to have_content("No certifications found")
    end

    scenario "with search results" do
      certification = create(:certification, number: "000")
      certification2 = create(:certification, number: "001")


      visit certifications_path
      fill_in 'certification-search-form', with: certification.number
      click_button 'search-btn'

      expect(page).to have_content("000")
      expect(page).to_not have_content("001")
    end
  end
end
