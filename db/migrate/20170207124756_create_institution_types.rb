class CreateInstitutionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :institution_types, :name
  end
end
