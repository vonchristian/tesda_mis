class AssessmentCenter < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
