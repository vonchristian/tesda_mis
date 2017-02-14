require 'rails_helper'

feature "Index page" do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  feature 'when logged in' do

    scenario "with clients" do
      client = create(:client)
      visit clients_path
      expect(page).to have_content(client.full_name)
    end

    scenario "without clients" do
      visit clients_path

      expect(page).to have_content("No clients")
    end

    scenario "with search results" do
      client = create(:client, last_name: "Dulnuan")
      client_2 = create(:client, last_name: "Halip")
      visit clients_path
      fill_in 'client-search-form', with: client_2.last_name
      click_button 'client-search-btn'


      expect(page).to have_content("Halip")
      expect(page).to_not have_content("Dulnuan")

    end
  end
end
