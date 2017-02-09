require 'rails_helper'

feature "Show training center" do
  scenario 'show training_center' do
    training_center = create(:training_center)
    visit training_centers_path
    click_link training_center.name

    expect(page).to have_content(training_center.name)
  end
end
