class Training < ApplicationRecord
  has_many :trainee_trainings
  has_many :trainees, through: :trainee_trainings
  belongs_to :competency, class_name: "Qualifications::Competency"
end