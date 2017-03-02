class AddAssessmentDateToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :assessment_date, :datetime
  end
end
