require 'rails_helper'

feature "Show Client" do
  scenario 'visit client' do
    client = create(:client)
    visit clients_path
    click_link client.full_name

    expect(page).to have_content(client.full_name)
  end
end
