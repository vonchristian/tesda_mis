class AddRegionIdToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :region, foreign_key: true
  end
end
