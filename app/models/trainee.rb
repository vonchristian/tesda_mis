class Trainee < ApplicationRecord
  has_many :trainee_trainings
  has_many :trainings, through: :trainee_trainings
  validates :first_name, :middle_name, :last_name, presence: true

  enum sex: [:male, :female]
end
