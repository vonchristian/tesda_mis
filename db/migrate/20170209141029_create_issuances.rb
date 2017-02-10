class CreateIssuances < ActiveRecord::Migration[5.0]
  def change
    create_table :issuances do |t|
      t.string :type
      t.string :reference_number
      t.integer :issuable_id
      t.string :issuable_type
      t.datetime :issue_date

      t.timestamps
    end
    add_index :issuances, :type
    add_index :issuances, :issuable_id
    add_index :issuances, :issuable_type
  end
end
