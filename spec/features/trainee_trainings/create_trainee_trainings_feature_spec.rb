require 'rails_helper'

feature "Create trainee training" do
  scenario "with valid attributes" do
    trainee = create(:trainee)
    visit trainee_path(trainee)
    click_link "New Training"
    competency = create(:competency, unit_title: "Training Day")
    training = create(:training, competency: competency)
    select "Training Day"
    click_button "Create Training"

    expect(page).to have_content('created successfully')
  end
end
