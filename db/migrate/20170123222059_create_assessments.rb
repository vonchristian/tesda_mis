class CreateAssessments < ActiveRecord::Migration[5.0]
  def change
    create_table :assessments do |t|
      t.belongs_to :trainee, foreign_key: true
      t.belongs_to :assessor, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
