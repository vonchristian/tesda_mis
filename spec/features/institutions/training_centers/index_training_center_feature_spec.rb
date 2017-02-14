require 'rails_helper'

feature "Training centers index" do
  feature 'when logged in' do
    scenario "with training_centers" do
      institution = create(:institution, name: "TESDA")
      training_center = create(:training_center, institution: institution)
      visit training_centers_path

      expect(page).to have_content(training_center.name)
    end

    scenario "without training centers" do
      visit training_centers_path

      expect(page).to have_content("No training centers found")
    end

    scenario "with search results" do
      institution = create(:institution, name: "TESDA")
      institution_2 = create(:institution, name: "RPASI")

      training_center = create(:training_center, institution: institution)
      training_center2 = create(:training_center, institution: institution_2)

      visit training_centers_path
      fill_in 'training_center-search-form', with: training_center.name
      click_button 'training-center-search-btn'

      expect(page).to have_content("TESDA")
      expect(page).to_not have_content("RPASI")
    end
  end
end
