class AddResultToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :result, :integer
    add_column :assessments, :assessment_date, :datetime
    add_column :assessments, :application_date, :datetime
  end
end
