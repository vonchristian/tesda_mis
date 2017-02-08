class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.belongs_to :client, foreign_key: true
      t.belongs_to :educational_attainment, foreign_key: true

      t.timestamps
    end
  end
end
