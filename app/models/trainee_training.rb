class TraineeTraining < ApplicationRecord
  has_one :assessment
  belongs_to :trainee
  belongs_to :training

end
