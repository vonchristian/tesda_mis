class AddRegistryToTraineeTraining < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainee_trainings, :registry, foreign_key: true
  end
end
