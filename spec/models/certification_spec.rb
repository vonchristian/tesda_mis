require 'rails_helper'

describe Certification, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :client }
    it { is_expected.to belong_to :certified }
    it { is_expected.to belong_to :registry }
    it { is_expected.to belong_to :certification_level }
    it { is_expected.to have_many :issuances }
  end

  describe "delegations" do 
    it { is_expected.to delegate_method(:full_name).to(:client).with_prefix }
    it { is_expected.to delegate_method(:first_and_last_name).to(:client).with_prefix }
    it { is_expected.to delegate_method(:sex).to(:client).with_prefix }
    it { is_expected.to delegate_method(:contact_number).to(:client).with_prefix }
    it { is_expected.to delegate_method(:first_name).to(:client).with_prefix }
    it { is_expected.to delegate_method(:last_name).to(:client).with_prefix }
    it { is_expected.to delegate_method(:middle_name).to(:client).with_prefix }
    it { is_expected.to delegate_method(:name).to(:qualification).with_prefix }
    it { is_expected.to delegate_method(:level).to(:certification_level).with_prefix }
    it { is_expected.to delegate_method(:assessor).to(:certified) }
    it { is_expected.to delegate_method(:assessee).to(:certified) }
    it { is_expected.to delegate_method(:full_name).to(:assessee).with_prefix }
    it { is_expected.to delegate_method(:full_name).to(:assessor).with_prefix }
  end


  it "#national_certificate?" do 
    national_certificate = build(:certification, type: "Certifications::NationalCertificate")
    certificate_of_competency = build(:certification, type: "Certifications::CertificateOfCompetency")

    expect(national_certificate.national_certificate?).to be true
    expect(certificate_of_competency.national_certificate?).to be false 
  end

  it "#certificate_of_competency?" do 
    national_certificate = build(:certification, type: "Certifications::NationalCertificate")
    certificate_of_competency = build(:certification, type: "Certifications::CertificateOfCompetency")

    expect(national_certificate.certificate_of_competency?).to be false
    expect(certificate_of_competency.certificate_of_competency?).to be true 
  end
  it ".expired" do 
    certification_1 = create(:certification, issue_date: Date.today, expiry_date: Date.today.next_year(5))
    certification_2 = create(:certification, issue_date: Date.today, expiry_date: Date.today.next_year(6))
    travel_to(Date.today.next_year(5) + 1.day)
    
    expect(Certification.expired).to include(certification_1)
    expect(Certification.expired).to_not include(certification_2)
  end

  it "#expired?" do 
    certification = create(:certification, issue_date: Date.today, expiry_date: Date.today.next_year(5))
    travel_to(Date.today.next_year(5) + 1.day)

    expect(certification.expired?).to be true
  end
end
