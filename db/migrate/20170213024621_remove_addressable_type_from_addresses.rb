class RemoveAddressableTypeFromAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_index :addresses, :addressable_type
    remove_column :addresses, :addressable_type, :integer
  end
end
