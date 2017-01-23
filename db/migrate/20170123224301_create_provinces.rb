class CreateProvinces < ActiveRecord::Migration[5.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.belongs_to :region, foreign_key: true

      t.timestamps
    end
  end
end
