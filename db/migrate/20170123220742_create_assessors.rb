class CreateAssessors < ActiveRecord::Migration[5.0]
  def change
    create_table :assessors do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name

      t.timestamps
    end
  end
end
