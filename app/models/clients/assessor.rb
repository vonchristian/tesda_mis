module Clients
  class Assessor < ApplicationRecord
    include PgSearch
    # multisearchable :against => [:last_name]
    pg_search_scope :text_search, :against => [:last_name, :first_name]
    belongs_to :client
    has_many :accreditations, as: :accredited
    has_many :qualifications, through: :accreditations
    has_many :conducted_assessments, class_name: "Assessment"

    delegate :full_name, :last_name, :first_name, to: :client
  end
end
