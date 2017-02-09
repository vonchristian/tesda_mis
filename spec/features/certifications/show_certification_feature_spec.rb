require 'rails_helper'

feature "Show certification" do
  scenario 'show certification' do
    certification = create(:certification, number: "000")
    visit certifications_path
    click_link certification.number

    expect(page).to have_content(certification.number)
  end
end
