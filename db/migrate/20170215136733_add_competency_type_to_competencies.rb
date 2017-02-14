class AddCompetencyTypeToCompetencies < ActiveRecord::Migration[5.0]
  def change
    add_column :competencies, :competency_type, :integer
    add_index :competencies, :competency_type
  end
end
