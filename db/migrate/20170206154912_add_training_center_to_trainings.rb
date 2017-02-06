class AddTrainingCenterToTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainings, :training_center, foreign_key: true
    add_column :trainings, :start_date, :datetime
    add_column :trainings, :end_date, :datetime

  end
end
