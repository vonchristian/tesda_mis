class RemoveAssessmentFromTrainings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :trainings, :assessment, foreign_key: true
  end
end
