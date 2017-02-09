require 'rails_helper'

feature "Show Institution" do
  scenario 'show institution' do
    institution = create(:institution)
    visit institutions_path
    click_link institution.name

    expect(page).to have_content(institution.name)
  end
end
