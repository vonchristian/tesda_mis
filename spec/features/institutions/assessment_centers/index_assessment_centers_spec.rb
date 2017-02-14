require 'rails_helper'

feature "assessment centers index" do
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  feature 'when logged in' do
    scenario "with assessment centers" do
      institution = create(:institution, name: "TESDA")
      assessment_center = create(:assessment_center, institution: institution)
      visit assessment_centers_path

      expect(page).to have_content(assessment_center.name)
    end

    scenario "without assessment centers" do
      visit assessment_centers_path

      expect(page).to have_content("No assessment centers found")
    end

    scenario "with search results" do
      institution = create(:institution, name: "TESDA")
      institution_2 = create(:institution, name: "RPASI")

      assessment_center = create(:assessment_center, institution: institution)
      assessment_center2 = create(:assessment_center, institution: institution_2)

      visit assessment_centers_path
      fill_in 'assessment-center-search-form', with: assessment_center.name
      click_button 'assessment-center-search-btn'

      expect(page).to have_content("TESDA")
      expect(page).to_not have_content("RPASI")
    end
  end
end
