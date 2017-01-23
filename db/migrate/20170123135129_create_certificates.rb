class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.string :type
      t.belongs_to :trainee, foreign_key: true
      t.datetime :date_issued
      t.datetime :expiry_date
      t.string :number

      t.timestamps
    end
    add_index :certificates, :type
    add_index :certificates, :number
  end
end
