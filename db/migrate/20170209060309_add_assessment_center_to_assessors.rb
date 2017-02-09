class AddAssessmentCenterToAssessors < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessors, :assessment_center, foreign_key: true
  end
end
