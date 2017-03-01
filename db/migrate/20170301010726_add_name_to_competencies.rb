class AddNameToCompetencies < ActiveRecord::Migration[5.0]
  def change
    add_column :competencies, :name, :string
  end
end
