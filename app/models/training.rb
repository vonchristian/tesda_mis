class Training < ApplicationRecord
  belongs_to :trainor, class_name: "Clients::Trainor"
  belongs_to :training_center, class_name: "Institution", foreign_key: 'training_center_id'
  has_many :client_trainings, class_name: "Clients::CompletedTraining"
  has_many :clients, through: :completed_trainings, class_name: "Client"
  belongs_to :competency, class_name: "Qualifications::Competency"

  delegate :qualification, to: :competency

  def name
    competency.unit_title
  end
end
