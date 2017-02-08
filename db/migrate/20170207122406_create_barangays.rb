class CreateBarangays < ActiveRecord::Migration[5.0]
  def change
    create_table :barangays do |t|
      t.string :name
      t.belongs_to :municipality_or_city, foreign_key: true

      t.timestamps
    end
    add_index :barangays, :name, unique: true
  end
end
