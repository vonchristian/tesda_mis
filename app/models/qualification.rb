class Qualification < ApplicationRecord
  include PgSearch
  extend FriendlyId
  friendly_id :name, use: :slugged
  multisearchable :against => [:name], :order_within_rank => "qualifications.created_at DESC"
  pg_search_scope :text_search, :against => [:name, :name]
  belongs_to :sector
  has_many :competencies, class_name: 'Qualifications::Competency'
  has_many :accreditations, foreign_key: "qualification_id"
  has_many :nc_certifieds, class_name: "Certifications::NationalCertificate", foreign_key: 'qualification_id'
  has_many :coc_certifieds, class_name: "Certifications::CertificateOfCompetency", foreign_key: 'qualification_id'

  has_many :accredited_assessors, through: :accreditations, source: :accredited, source_type: "Clients::Assessor"
  has_many :accredited_trainors, through: :accreditations, source: :accredited, source_type: "Clients::Trainor"

  has_many :accredited_assessment_centers, through: :accreditations, source: :accredited, source_type: "Institutions::AssessmentCenter"
  has_many :accredited_training_centers, through: :accreditations, source: :accredited, source_type: "Institutions::TrainingCenter"



  validates :name, presence: true, uniqueness: true

  delegate :name, to: :sector, prefix: true, allow_nil: true
end
