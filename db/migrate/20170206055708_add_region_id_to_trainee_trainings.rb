class AddRegionIdToTraineeTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainee_trainings, :region, foreign_key: true
  end
end
