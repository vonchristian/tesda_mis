class AddRegistryToCompletedTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :completed_trainings, :registry, foreign_key: true
  end
end
