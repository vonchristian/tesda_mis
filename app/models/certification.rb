class Certification < ApplicationRecord
  include PgSearch
  # multisearchable :against => [:last_name]
  pg_search_scope :text_search, :against => [:number]
  
  belongs_to :certified, polymorphic: true
  belongs_to :certification_level, class_name: "Configurations::CertificationLevel"
  has_many :issuances, as: :issuable
  
  delegate :client, to: :certified
  delegate :full_name, to: :client, prefix: true
  delegate :qualification, to: :certified
  delegate :level, to: :certification_level, prefix: true
  delegate :assessor, to: :certified, allow_nil: true
  delegate :full_name, to: :assessor, prefix: true
  delegate :name, to: :qualification, prefix: true
  delegate :assessee, to: :certified, allow_nil: true
  delegate :full_name, to: :assessee, prefix: true, allow_nil: true
end
