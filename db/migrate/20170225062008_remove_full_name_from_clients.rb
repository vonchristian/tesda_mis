class RemoveFullNameFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :full_name, :string
  end
end
