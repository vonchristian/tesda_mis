require 'rails_helper'

feature "Create training" do
  scenario "with valid attributes" do

    trainee = create(:trainee)
    training = create(:training)
    trainee_training = create(:trainee_training, trainee: trainee, training: training)
    assessment = create(:assessment, trainee_training: trainee_training, trainee: trainee)
    visit assessments_path
    click_link assessment.trainee_name
    click_link "Issue Certificate"

    fill_in "Number",  with: '090903131311'
    click_button "Save Certificate"

    expect(page).to have_content('created successfully')
  end
end
