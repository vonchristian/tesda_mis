require 'rails_helper'

feature "Edit Client" do
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    client = create(:client)
    visit clients_path
    click_link client.full_name
    click_link "Update Info"
  end
  scenario 'with valid attributes' do
    attach_file("Upload Photo", Rails.root + "spec/support/avatars/default_avatar.png")
    fill_in "First name", with: "Von Christian"
    fill_in "Middle name", with: "Pinosan"
    fill_in "Last name", with: "Halip"
    click_button "Save Client"

    expect(page).to have_content("updated successfully")
  end
  scenario "with invalid attributes" do 
    fill_in "Last name", with: ''
    click_button "Save Client"

    expect(page).to have_content("can't be blank")
  end
end
