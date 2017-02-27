class AddCarsDateToIssuances < ActiveRecord::Migration[5.0]
  def change
    add_column :issuances, :cars_date_received, :datetime
    add_column :issuances, :printing_date, :datetime
  end
end
