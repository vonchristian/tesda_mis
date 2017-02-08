class Assessment < ApplicationRecord
  belongs_to :assessment_center, class_name: "Institutions::AssessmentCenter"
  belongs_to :assessor, class_name: "Clients::Assessor"
  belongs_to :assessee, polymorphic: true
  has_one :certification, as: :certified

  enum result: [:competent, :not_yet_competent]
end
