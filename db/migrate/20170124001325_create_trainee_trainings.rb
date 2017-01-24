class CreateTraineeTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainee_trainings do |t|
      t.belongs_to :trainee, foreign_key: true
      t.belongs_to :training, foreign_key: true
      t.string :reference_number

      t.timestamps
    end
  end
end
