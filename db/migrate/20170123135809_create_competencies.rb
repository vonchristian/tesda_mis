class CreateCompetencies < ActiveRecord::Migration[5.0]
  def change
    create_table :competencies do |t|
      t.belongs_to :qualification, foreign_key: true
      t.string :unit_code, unique: true
      t.string :unit_title

      t.timestamps
    end
  end
end
