class AddTrainorIdToTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainings, :trainor, foreign_key: true
  end
end
