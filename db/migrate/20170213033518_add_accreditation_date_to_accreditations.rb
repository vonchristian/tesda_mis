class AddAccreditationDateToAccreditations < ActiveRecord::Migration[5.0]
  def change
    add_column :accreditations, :accreditation_date, :datetime
    add_column :accreditations, :expiry_date, :datetime
  end
end
