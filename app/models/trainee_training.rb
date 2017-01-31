class TraineeTraining < ApplicationRecord
  has_one :assessment
  belongs_to :trainee
  belongs_to :training
  delegate :name, to: :training
  delegate :qualification, to: :training
  delegate :name, to: :qualification, prefix: true, allow_nil: true
end
