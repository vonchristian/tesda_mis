class Trainee < ApplicationRecord
  has_one :education, class_name: "Trainees::Education"
  has_one :educational_attainment, through: :education
  has_many :trainee_trainings
  has_many :trainings, through: :trainee_trainings
  validates :first_name, :middle_name, :last_name, presence: true

  enum sex: [:male, :female]

  accepts_nested_attributes_for :education
end
