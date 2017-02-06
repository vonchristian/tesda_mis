class CreateRegistries < ActiveRecord::Migration[5.0]
  def change
    create_table :registries do |t|
      t.attachment :sheet
      t.timestamps
    end
  end
end
