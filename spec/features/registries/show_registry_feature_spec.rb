require 'rails_helper'

feature "Show Registry" do
  scenario 'show registry' do
    registry = create(:registry)
    visit registries_path
    click_link registry.name

    expect(page).to have_content(registry.name)
  end
end
