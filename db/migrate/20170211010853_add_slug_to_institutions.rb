class AddSlugToInstitutions < ActiveRecord::Migration[5.0]
  def change
    add_column :institutions, :slug, :string, unique: true
  end
end
