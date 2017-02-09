module Clients
  class Assessor < ApplicationRecord
    include PgSearch
    # multisearchable :against => [:last_name]
    pg_search_scope :text_search, :against => [:last_name, :first_name]
    belongs_to :client
    has_many :accreditations, as: :accredited
    has_many :accredited_qualifications, through: :accreditations, source: :qualification
    has_many :conducted_assessments, class_name: "Assessment"

    delegate :full_name, :last_name, :first_name, to: :client, allow_nil: true
  end
end
