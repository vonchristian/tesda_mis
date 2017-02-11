class Certification < ApplicationRecord
  include PgSearch
  # multisearchable :against => [:last_name]
  pg_search_scope :text_search, :against => [:number]
  
  belongs_to :certified, polymorphic: true
  belongs_to :qualification
  belongs_to :competency, class_name: "Qualifications::Competency"
  belongs_to :certification_level, class_name: "Configurations::CertificationLevel"
  has_many :issuances, as: :issuable
  
  delegate :client, to: :certified
  delegate :full_name, to: :client, prefix: true
  delegate :level, to: :certification_level, prefix: true
  delegate :assessor, to: :certified, allow_nil: true
  delegate :full_name, to: :assessor, prefix: true
  delegate :name, to: :qualification, prefix: true, allow_nil: true
  delegate :name, to: :competency, prefix: true, allow_nil: true

  delegate :assessee, to: :certified, allow_nil: true
  delegate :full_name, to: :assessee, prefix: true, allow_nil: true

  def self.types
    ["Certifications::NationalCertificate", "Certifications::CertificateOfCompetency"]
  end

  def national_certificate?
    self.type == "Certifications::NationalCertificate"
  end

  def certificate_of_competency?
    self.type == "Certifications::CertificateOfCompetency"
  end
end
