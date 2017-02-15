class CreateAssessmentCenterManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_center_managers do |t|
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
