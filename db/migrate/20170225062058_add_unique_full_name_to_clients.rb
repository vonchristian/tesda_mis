class AddUniqueFullNameToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :full_name, :string
    add_index :clients, :full_name, unique: true
  end
end
