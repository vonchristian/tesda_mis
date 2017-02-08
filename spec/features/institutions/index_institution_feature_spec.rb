require 'rails_helper'

feature "Institutions index" do
  feature 'when logged in' do
    scenario "with institutions" do
      institution = create(:institution, name: "TESDA")
      visit institutions_path

      expect(page).to have_content(institution.name)
    end

    scenario "without registries" do
      visit institutions_path

      expect(page).to have_content("No institution found")
    end

    scenario "with search results" do
      institution = create(:institution, name: "TESDA")
      institution2 = create(:institution, name: "TEST")

      visit institutions_path
      fill_in 'institution-search-form', with: institution.name
      click_button 'search-btn'

      expect(page).to have_content("TESDA")
      expect(page).to_not have_content("TEST")

    end
  end
end
