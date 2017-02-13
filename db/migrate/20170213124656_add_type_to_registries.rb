class AddTypeToRegistries < ActiveRecord::Migration[5.0]
  def change
    add_column :registries, :type, :string
    add_index :registries, :type
  end
end
