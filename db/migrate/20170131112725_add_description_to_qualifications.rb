class AddDescriptionToQualifications < ActiveRecord::Migration[5.0]
  def change
    add_column :qualifications, :description, :string
  end
end
