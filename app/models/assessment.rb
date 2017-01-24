class Assessment < ApplicationRecord
  belongs_to :trainee
  belongs_to :assessor
  belongs_to :trainee_training

  validates :date, presence: true
end
