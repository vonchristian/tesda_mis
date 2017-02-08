class Qualification < ApplicationRecord
  belongs_to :sector
  has_many :competencies, class_name: 'Qualifications::Competency'
  has_many :accreditations, foreign_key: "qualification_id"
  has_many :accredited_clients, through: :accreditations, source: :accredited, source_type: "Client"
  has_many :accredited_institutions, through: :accreditations, source: :accredited, source_type: "Institution"


  validates :name, presence: true, uniqueness: true

  delegate :name, to: :sector, prefix: true
end
