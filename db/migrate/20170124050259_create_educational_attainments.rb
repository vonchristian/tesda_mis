class CreateEducationalAttainments < ActiveRecord::Migration[5.0]
  def change
    create_table :educational_attainments do |t|
      t.string :title

      t.timestamps
    end
  end
end
