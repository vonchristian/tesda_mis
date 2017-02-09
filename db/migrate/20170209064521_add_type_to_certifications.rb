class AddTypeToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :type, :string
    add_index :certifications, :type
  end
end
