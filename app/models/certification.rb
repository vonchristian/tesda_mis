class Certification < ApplicationRecord
  include PgSearch
  # multisearchable :against => [:last_name]
  pg_search_scope :text_search, :against => [:number]
  belongs_to :certified, polymorphic: true
  belongs_to :certification_type, class_name: "Certifications::CertificationType"
  belongs_to :certification_level, class_name: "Configurations::CertificationLevel"
end
