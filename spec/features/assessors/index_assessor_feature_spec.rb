require 'rails_helper'

feature "Index page" do
  before(:each) do

  end

  feature 'when logged in' do

    scenario "with assessors" do
      assessor = create(:assessor)
      visit assessors_path
      expect(page).to have_content(assessor.full_name)
    end

    scenario "without assessors" do
      visit assessors_path

      expect(page).to have_content("No assessors")
    end
 
    scenario "with search results" do
      client_1 = create(:client, last_name: "Dulnuan")
      client_2 = create(:client, last_name: "Halip")
      assessor = create(:assessor, client: client_1)
      assessor_2 = create(:assessor, client: client_2)
      visit assessors_path
      fill_in 'assessor-search-form', with: assessor_2.last_name
      click_button 'search-btn'

      expect(page).to have_content("Halip")
      expect(page).to_not have_content("Dulnuan")
    end
  end
end
