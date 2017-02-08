class CreateAssessments < ActiveRecord::Migration[5.0]
  def change
    create_table :assessments do |t|
      t.integer :assessor_id, index: true, foreign_key: true
      t.integer :assessee_id, index: true, foreign_key: true
      t.string :assessee_type, index: true, foreign_key: true    
      t.datetime :date
      t.integer :result

      t.timestamps
    end
  end
end
