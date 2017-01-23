class AddTrainingToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessments, :training, foreign_key: true
  end
end
