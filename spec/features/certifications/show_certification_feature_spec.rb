require 'rails_helper'

feature "Show certification" do
  scenario 'show certification' do
    client = create(:client)
    assessee = create(:completed_training, client: client)
    assessment = create(:assessment, assessee: assessee)
    certification = create(:national_certificate, number: "000", certified: assessment)
    visit certifications_path
    click_link certification.number

    expect(page).to have_content(certification.number)
  end
end
