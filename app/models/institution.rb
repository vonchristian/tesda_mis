class Institution < ApplicationRecord
  include PgSearch
  has_attached_file :logo,
  styles: { large: "120x120>",
            medium: "70x70>",
            thumb: "40x40>",
            small: "30x30>",
            x_small: "20x20>"},
  default_url: ":style/logo_default.png",
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  # multisearchable :against => [:last_name]
  pg_search_scope :text_search, :against => [:name]
  has_many :accreditations, as: :accredited
  has_many :accredited_services, through: :accreditations, class_name: "InstitutionType", foreign_key: 'institution_type_id'
  has_many :assessment_center_services, class_name: "Institutions::AssessmentCenter"
  has_many :assessors, through: :assessment_center_services, class_name: "Clients::Assessor"
  has_many :conducted_assessments, through: :assessment_center_services

  validates :name, presence: true
  def address_details 
  end
end
