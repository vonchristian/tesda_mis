class CreateEducationalAttainments < ActiveRecord::Migration[5.0]
  def change
    create_table :educational_attainments do |t|
      t.string :name

      t.timestamps
    end
  end
end
