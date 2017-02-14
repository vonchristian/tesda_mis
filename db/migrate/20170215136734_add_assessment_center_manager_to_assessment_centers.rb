class AddAssessmentCenterManagerToAssessmentCenters < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessment_centers, :assessment_center_manager, foreign_key: true
  end
end
