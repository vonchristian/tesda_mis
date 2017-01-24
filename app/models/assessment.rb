class Assessment < ApplicationRecord
  belongs_to :trainee
  belongs_to :assessor
  belongs_to :trainee_training
  has_one :certificate, as: :certified, class_name: "Assessments::Certificate"
  validates :application_date, :assessment_date, presence: true

  enum results: [:competent, :not_yet_competent]

  def trainee_name
    trainee_training.trainee.first_name
  end
end
