class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :province, foreign_key: true
      t.belongs_to :municipality_or_city, foreign_key: true
      t.belongs_to :barangay, foreign_key: true
      t.integer :addressable_id
      t.integer :addressable_type
      t.boolean :current, default: false

      t.timestamps
    end
    add_index :addresses, :addressable_id
    add_index :addresses, :addressable_type
  end
end
