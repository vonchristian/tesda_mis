class Qualification < ApplicationRecord
  include PgSearch
  extend FriendlyId
  friendly_id :name, use: :slugged
  multisearchable :against => [:name], :order_within_rank => "qualifications.created_at DESC"
  pg_search_scope :text_search, :against => [:name, :name]
  belongs_to :sector
  has_many :competencies, class_name: 'Qualifications::Competency'
  has_many :accreditations, foreign_key: "qualification_id"
  has_many :accredited_clients, through: :accreditations, source: :accredited, source_type: "Client"
  has_many :accredited_institutions, through: :accreditations, source: :accredited, source_type: "Institution"


  validates :name, presence: true, uniqueness: true

  delegate :name, to: :sector, prefix: true
end
