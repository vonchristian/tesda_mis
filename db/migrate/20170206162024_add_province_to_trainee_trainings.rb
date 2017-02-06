class AddProvinceToTraineeTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainee_trainings, :province, foreign_key: true
  end
end
