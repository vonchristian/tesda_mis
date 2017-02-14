require 'rails_helper'

feature "Show Institution" do
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  
  scenario 'show institution' do
    institution = create(:institution)
    visit institutions_path
    click_link institution.name

    expect(page).to have_content(institution.name)
  end
end
