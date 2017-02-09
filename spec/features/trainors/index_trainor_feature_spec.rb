require 'rails_helper'

feature "Index page" do
  before(:each) do

  end

  feature 'when logged in' do

    scenario "with trainors" do
      trainor = create(:trainor)
      visit trainors_path
      expect(page).to have_content(trainor.full_name)
    end

    scenario "without trainors" do
      visit trainors_path

      expect(page).to have_content("No trainors")
    end
 
    scenario "with search results" do
      client_1 = create(:client, last_name: "Dulnuan")
      client_2 = create(:client, last_name: "Halip")
      trainor = create(:trainor, client: client_1)
      trainor_2 = create(:trainor, client: client_2)
      visit trainors_path
      fill_in 'trainor-search-form', with: trainor_2.last_name
      click_button 'search-btn'

      expect(page).to have_content("Halip")
      expect(page).to_not have_content("Dulnuan")
    end
  end
end
