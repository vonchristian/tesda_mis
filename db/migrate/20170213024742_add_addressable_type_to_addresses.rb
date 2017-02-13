class AddAddressableTypeToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :addressable_type, :string
    add_index :addresses, :addressable_type
  end
end
