module Clients
  class Assessor < ApplicationRecord
    include PgSearch
    # multisearchable :against => [:last_name]
    pg_search_scope :text_search, :against => [:last_name, :first_name]
    belongs_to :client
    has_many :employments, class_name: "Clients::Employment"
    belongs_to :assessment_center, class_name: "Institutions::AssessmentCenter", foreign_key: "assessment_center_id"
    has_many :accreditations, as: :accredited
    has_many :accredited_qualifications, through: :accreditations, source: :qualification
    has_many :conducted_assessments, class_name: "Assessment"
    has_many :educations, as: :educationship
    has_many :addresses, as: :addressable

    delegate :full_name, :last_name, :first_name, to: :client, allow_nil: true
    delegate :avatar, to: :client
    def current_address
    end
  end
end
