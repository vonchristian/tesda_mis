class CreateMunicipalityOrCities < ActiveRecord::Migration[5.0]
  def change
    create_table :municipality_or_cities do |t|
      t.integer :locality_type
      t.string :name
      t.belongs_to :province, foreign_key: true

      t.timestamps
    end
    add_index :municipality_or_cities, :locality_type
    add_index :municipality_or_cities, :name, unique: true
  end
end
