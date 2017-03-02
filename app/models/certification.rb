class Certification < ApplicationRecord
  include PgSearch
  extend FriendlyId
  friendly_id :number, use: :slugged

  multisearchable :against => [:number, :client_full_name, :client_last_name, :client_first_name]
  pg_search_scope :text_search, :against => [:number], :associated_against => {:client => [:last_name, :first_name], :qualification =>[:name]}
  
  belongs_to :certified, polymorphic: true
  belongs_to :qualification
  belongs_to :client
  belongs_to :competency, class_name: "Qualifications::Competency"
  belongs_to :certification_level, class_name: "Configurations::CertificationLevel"
  belongs_to :signatory, class_name: "Configurations::Signatory"
  has_many :issuances, as: :issuable
  has_many :competencies, through: :qualification
  
  delegate :full_name, :fullname, :first_name, :last_name, :name_with_middle_initial, :middle_name, :contact_number, :sex, to: :client, prefix: true, allow_nil: true
  delegate :level, to: :certification_level, prefix: true
  delegate :assessor, to: :certified, allow_nil: true
  delegate :full_name, to: :assessor, prefix: true, allow_nil: true
  delegate :name, to: :qualification, prefix: true, allow_nil: true
  delegate :name, :unit_title, to: :competency, prefix: true, allow_nil: true
  delegate :qualification_name, to: :competency, prefix: true, allow_nil: true
  delegate :assessee, to: :certified, allow_nil: true
  delegate :full_name, to: :assessee, prefix: true, allow_nil: true
  delegate :full_name, :designation, to: :signatory, prefix: true, allow_nil: true
  delegate :assessment_date, to: :certified
  delegate :revised?, to: :qualification, allow_nil: true
  
  validates :number, uniqueness: true
  validates :client_id, presence: true
  
  before_commit :set_signatory

  def self.expires_on(hash={})
    if hash[:from_date] && hash[:to_date]
      from_date = hash[:from_date].kind_of?(Time) ? hash[:from_date] : Time.parse(hash[:from_date].strftime('%Y-%m-%d 12:00:00'))
      to_date = hash[:to_date].kind_of?(Time) ? hash[:to_date] : Time.parse(hash[:to_date].strftime('%Y-%m-%d 12:59:59'))
      where('certifications.expiry_date' => from_date..to_date)
    else
      expired
    end
  end

  def self.types
    ["Certifications::NationalCertificate", "Certifications::CertificateOfCompetency"]
  end

  def self.expired
    all.select {|a| a.expired? }
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
   def link_color
    if expired? || revised?
      "danger"
    end
  end
  private 
  def set_signatory
    Configurations::Signatory.set(self)
    self.save
  end
end
