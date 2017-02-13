class CreateEmployments < ActiveRecord::Migration[5.0]
  def change
    create_table :employments do |t|
      t.string :designation
      t.belongs_to :company, foreign_key: true
      t.belongs_to :assessor, foreign_key: true

      t.timestamps
    end
  end
end
