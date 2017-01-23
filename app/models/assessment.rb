class Assessment < ApplicationRecord
  belongs_to :trainee
  belongs_to :assessor

  validates :date, presence: true
end
