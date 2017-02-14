module Institutions
  class AssessmentCenter < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    belongs_to :institution
    belongs_to :assessment_center_manager
    has_many :accreditations, as: :accredited
    has_many :accredited_qualifications, through: :accreditations, source: :qualification
    has_many :conducted_assessments, class_name: "Assessment", foreign_key: "assessment_center_id"
    has_many :assessors, class_name: "Clients::Assessor", foreign_key: "assessment_center_id"
    
    delegate :name, to: :institution
    delegate :logo, to: :institution
    delegate :address_details, to: :institution
  end
end
