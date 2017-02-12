class Certification < ApplicationRecord
  include PgSearch
  extend FriendlyId
  friendly_id :number, use: :slugged

  # multisearchable :against => [:last_name]
  pg_search_scope :text_search, :against => [:number]
  
  belongs_to :certified, polymorphic: true
  belongs_to :qualification
  belongs_to :client
  belongs_to :competency, class_name: "Qualifications::Competency"
  belongs_to :certification_level, class_name: "Configurations::CertificationLevel"
  has_many :issuances, as: :issuable
  
  delegate :full_name, to: :client, prefix: true, allow_nil: true
  delegate :level, to: :certification_level, prefix: true
  delegate :assessor, to: :certified, allow_nil: true
  delegate :full_name, to: :assessor, prefix: true, allow_nil: true
  delegate :name, to: :qualification, prefix: true, allow_nil: true
  delegate :name, to: :competency, prefix: true, allow_nil: true

  delegate :assessee, to: :certified, allow_nil: true
  delegate :full_name, to: :assessee, prefix: true, allow_nil: true
 
  def self.types
    ["Certifications::NationalCertificate", "Certifications::CertificateOfCompetency"]
  end

  def self.expired
    all.select{|a| a.expired? }
  end

  def national_certificate?
    self.type == "Certifications::NationalCertificate"
  end

  def certificate_of_competency?
    self.type == "Certifications::CertificateOfCompetency"
  end
  def qualification_name_without_cert_level
    qualification_name.gsub("NC", "").gsub("I", "").gsub("II", "").gsub("III", "").gsub("IV", "")
  end
  def name 
    if national_certificate?
      qualification_name
    elsif certificate_of_competency?
      competency_name 
    end 
  end 
  def type_name 
    if national_certificate?
      "National Certificate"
    elsif certificate_of_competency?
      "Certificate Of Competency"
    end 
  end 
  def expired?
   expiry_date < Time.zone.now
  end
end
