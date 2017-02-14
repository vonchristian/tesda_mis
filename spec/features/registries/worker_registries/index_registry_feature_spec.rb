require 'rails_helper'

feature "Registry index" do
  feature 'when logged in' do
    scenario "with registries" do
      registry = create(:registry, name: "RWAC")
      visit worker_registries_path

      expect(page).to have_content(registry.name)
    end

    scenario "without registries" do
      visit worker_registries_path

      expect(page).to have_content("No registries found")
    end

    scenario "with search results" do
      registry = create(:registry, name: "RWAC")
      registry2 = create(:registry, name: "TEST")


      visit worker_registries_path
      fill_in 'registry-search-form', with: registry.name
      click_button 'search-btn'

      expect(page).to have_content("RWAC")
      expect(page).to_not have_content("TEST")

    end
  end
end
