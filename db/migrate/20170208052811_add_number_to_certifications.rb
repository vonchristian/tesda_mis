class AddNumberToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :number, :string, unique: true
  end
end
