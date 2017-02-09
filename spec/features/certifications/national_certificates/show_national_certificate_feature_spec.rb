require 'rails_helper'

feature "Show national_certificate" do
  scenario 'show national certificate' do
    national_certificate = create(:national_certificate, number: "000")
    visit national_certificates_path
    click_link national_certificate.number

    expect(page).to have_content(national_certificate.number)
  end
end
