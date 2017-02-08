class CreateTrainingCenters < ActiveRecord::Migration[5.0]
  def change
    create_table :training_centers do |t|
      t.belongs_to :institution, foreign_key: true

      t.timestamps
    end
  end
end
