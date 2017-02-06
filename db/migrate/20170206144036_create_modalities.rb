class CreateModalities < ActiveRecord::Migration[5.0]
  def change
    create_table :modalities do |t|
      t.string :name

      t.timestamps
    end
    add_index :modalities, :name
  end
end
