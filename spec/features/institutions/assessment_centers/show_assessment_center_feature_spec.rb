require 'rails_helper'

feature "Show assessment center" do
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  scenario 'show assessment_center' do
    assessment_center = create(:assessment_center)
    visit assessment_centers_path
    click_link assessment_center.name

    expect(page).to have_content(assessment_center.name)
  end
end
