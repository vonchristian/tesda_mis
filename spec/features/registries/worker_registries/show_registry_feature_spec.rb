require 'rails_helper'

feature "Show Registry" do
   before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  scenario 'show registry' do
    registry = create(:worker_registry)
    visit worker_registries_path
    click_link registry.name

    expect(page).to have_content(registry.name)
  end
end
