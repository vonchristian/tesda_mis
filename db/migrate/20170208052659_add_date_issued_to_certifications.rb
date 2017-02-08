class AddDateIssuedToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :issue_date, :datetime
    add_column :certifications, :expiry_date, :datetime
  end
end
