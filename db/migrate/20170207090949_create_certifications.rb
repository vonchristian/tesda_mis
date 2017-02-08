class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications do |t|
      t.integer :certified_id
      t.string :certified_type

      t.timestamps
    end
    add_index :certifications, :certified_id
    add_index :certifications, :certified_type
  end
end
