class RemoveTypeFromCompetencies < ActiveRecord::Migration[5.0]
  def change
    remove_index :competencies, :type
    remove_column :competencies, :type, :string
  end
end
