class AddAssessmentCenterToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :assessment_center_id, :integer, index: true, foreign_key: true
  end
end
