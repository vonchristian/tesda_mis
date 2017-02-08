class CreateQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.string :name
      t.integer :sector_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
