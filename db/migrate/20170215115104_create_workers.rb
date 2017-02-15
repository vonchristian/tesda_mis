class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
