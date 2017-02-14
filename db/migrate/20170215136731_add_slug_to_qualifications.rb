class AddSlugToQualifications < ActiveRecord::Migration[5.0]
  def change
    add_column :qualifications, :slug, :string
    add_index :qualifications, :slug, unique: true
  end
end
