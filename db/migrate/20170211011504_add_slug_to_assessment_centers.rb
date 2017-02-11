class AddSlugToAssessmentCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :assessment_centers, :slug, :string, unique: true
  end
end
