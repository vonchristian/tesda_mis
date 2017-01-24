require 'rails_helper'

feature "Create trainee training" do
  scenario "with valid attributes" do
    trainee = create(:trainee)
    training = create(:training)
    trainee_training = create(:trainee_training, trainee: trainee, training: training)
    visit trainee_path(trainee)
    click_link trainee_training.name
    click_link "New Assessment"
    choose "Competent"
    fill_in "Application date", with: Date.today
    fill_in "Assessment date", with: Date.today

    click_button "Save Assessment"
    expect(page).to have_content('saved successfully')
  end
end
