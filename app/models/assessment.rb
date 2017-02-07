class Assessment < ApplicationRecord
  belongs_to :assessment_center
  belongs_to :trainee
  belongs_to :assessor
  belongs_to :trainee_training, class_name: "Trainees::TraineeTraining"
  has_one :certificate, as: :certified, class_name: "Assessments::Certificate"
  # validates :application_date, :assessment_date, presence: true

  enum result: [:competent, :not_yet_competent]
  delegate :training, to: :trainee_training
  delegate :competency, to: :trainee_training
  delegate :name, to: :competency
  def trainee_name
    trainee_training.trainee.first_name
  end
  def name
    trainee_training.trainee.first_name
  end
end
