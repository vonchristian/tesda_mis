class Assessment < ApplicationRecord
  belongs_to :assessment_center, class_name: "Institutions::AssessmentCenter", foreign_key: "assessment_center_id"
  belongs_to :assessor, class_name: "Clients::Assessor"
  belongs_to :assessee, polymorphic: true
  has_one :certification, as: :certified
  enum result: [:competent, :not_yet_competent]
  delegate :full_name, to: :assessee, prefix: true
  delegate :full_name, to: :assessor, prefix: true
  delegate :name, to: :assessee
  delegate :client, to: :assessee
  delegate :qualification, to: :assessee
  delegate :competency, to: :assessee
end
