class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.integer :sex
      t.string :contact_number

      t.timestamps
    end
  end
end
