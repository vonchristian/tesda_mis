class AddSlugToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :slug, :string
    add_index :certifications, :slug, unique: true
  end
end
