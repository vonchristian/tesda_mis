class AddAssessmentCenterToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessments, :assessment_center, foreign_key: true
  end
end
