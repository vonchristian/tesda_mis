class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.belongs_to :assessment, foreign_key: true

      t.timestamps
    end
  end
end
