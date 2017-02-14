class AssessmentCenterManager < ApplicationRecord
  belongs_to :client
  has_many :assessment_centers, class_name: "Institutions::AssessmentCenter"
end
