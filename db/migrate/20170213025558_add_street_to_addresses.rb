class AddStreetToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :street, :string
  end
end
