class CreateTrainingCenters < ActiveRecord::Migration[5.0]
  def change
    create_table :training_centers do |t|
      t.string :name

      t.timestamps
    end
  end
end
