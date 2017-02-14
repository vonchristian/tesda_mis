class AddTypeToCompetencies < ActiveRecord::Migration[5.0]
  def change
    add_column :competencies, :type, :string
    add_index :competencies, :type
    add_column :competencies, :default_competency, :boolean
  end
end
