require 'rails_helper'

feature "Create Client" do
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit clients_path
    click_link "New Client"
  end
  scenario 'with valid attributes' do
    attach_file("Upload Photo", Rails.root + "spec/support/avatars/default_avatar.png")
    fill_in "First name", with: "Von Christian"
    fill_in "Middle name", with: "Pinosan"
    fill_in "Last name", with: "Halip"
    click_button "Save Client"

    expect(page).to have_content("saved successfully")
  end
  scenario "with invalid attributes" do 
    click_button "Save Client"

    expect(page).to have_content("can't be blank")
  end
end
