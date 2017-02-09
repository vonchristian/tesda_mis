module Institutions
  class AssessmentCenter < ApplicationRecord
    belongs_to :institution
    has_many :accreditations, as: :accredited
    has_many :accredited_qualifications, through: :accreditations, source: :qualification
    has_many :conducted_assessments, class_name: "Assessment", foreign_key: "assessment_center_id"
    has_many :assessors, class_name: "Clients::Assessor", foreign_key: "assessment_center_id"
    delegate :name, to: :institution
  end
end
