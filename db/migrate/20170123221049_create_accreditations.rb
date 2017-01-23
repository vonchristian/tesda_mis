class CreateAccreditations < ActiveRecord::Migration[5.0]
  def change
    create_table :accreditations do |t|
      t.belongs_to :qualification, foreign_key: true
      t.belongs_to :assessor, foreign_key: true
      t.string :number

      t.timestamps
    end
  end
end
