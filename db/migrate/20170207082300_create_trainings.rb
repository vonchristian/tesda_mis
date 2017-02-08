class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.integer :trainer_id
      t.integer :training_center_id
      t.belongs_to :competency, foreign_key: true

      t.timestamps
    end
    add_index :trainings, :trainer_id
    add_index :trainings, :training_center_id
  end
end
