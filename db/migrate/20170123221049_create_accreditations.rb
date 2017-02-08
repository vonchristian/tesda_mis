class CreateAccreditations < ActiveRecord::Migration[5.0]
  def change
    create_table :accreditations do |t|
      t.belongs_to :qualification, foreign_key: true
      t.integer :accredited_id, index: true
      t.string :accredited_type, index: true
      t.string :number, unique: true

      t.timestamps
    end
  end
end
