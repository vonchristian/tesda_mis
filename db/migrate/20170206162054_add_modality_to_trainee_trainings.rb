class AddModalityToTraineeTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainee_trainings, :modality, foreign_key: true
  end
end
