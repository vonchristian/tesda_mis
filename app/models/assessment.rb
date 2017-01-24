class Assessment < ApplicationRecord
  belongs_to :trainee
  belongs_to :assessor
  belongs_to :trainee_training

  validates :application_date, :assessment_date, presence: true

  enum results: [:competent, :not_yet_competent]
end
