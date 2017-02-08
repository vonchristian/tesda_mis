class AddNumberToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :number, :string
    add_index :certifications, :number, unique: true
  end
end
