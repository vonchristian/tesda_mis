class CreateSignatories < ActiveRecord::Migration[5.0]
  def change
    create_table :signatories do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.datetime :term_start_date
      t.datetime :term_end_date
      t.string :designation

      t.timestamps
    end
  end
end
