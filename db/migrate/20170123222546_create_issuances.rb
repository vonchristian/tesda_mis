class CreateIssuances < ActiveRecord::Migration[5.0]
  def change
    create_table :issuances do |t|
      t.belongs_to :certificate, foreign_key: true
      t.string :serial_number
      t.date :application_date
      t.date :claim_date

      t.timestamps
    end
  end
end
