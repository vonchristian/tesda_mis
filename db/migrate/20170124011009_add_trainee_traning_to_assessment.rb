class AddTraineeTraningToAssessment < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessments, :trainee_training, foreign_key: true
  end
end
