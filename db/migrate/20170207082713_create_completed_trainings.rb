class CreateCompletedTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :completed_trainings do |t|
      t.belongs_to :client, foreign_key: true
      t.belongs_to :training, foreign_key: true

      t.timestamps
    end
  end
end
