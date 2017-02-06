class AddClientTypeToTraineeTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainee_trainings, :client_type, foreign_key: true
  end
end
