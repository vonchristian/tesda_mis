require 'rails_helper'

feature "Qualifications index" do
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  feature 'when logged in' do
    scenario "with qualifications " do
      qualification = create(:qualification, name: "Driving")
      visit qualifications_path

      expect(page).to have_content(qualification.name)
    end

    scenario "without qualifications" do
      visit qualifications_path

      expect(page).to have_content("No qualifications found")
    end

    scenario "with search results" do
      qualification = create(:qualification, name: "TESDA")
      qualification2 = create(:qualification, name: "TEST")

      visit qualifications_path
      fill_in 'qualification-search-form', with: qualification.name
      click_button 'qualification-search-btn'

      expect(page).to have_content("TESDA")
      expect(page).to_not have_content("TEST")

    end
  end
end
