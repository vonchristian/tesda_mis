class AddCertifiedIdAndCertifiedTypeToCertificates < ActiveRecord::Migration[5.0]
  def change
    add_column :certificates, :certified_id, :integer
    add_index :certificates, :certified_id
    add_column :certificates, :certified_type, :string
    add_index :certificates, :certified_type
  end
end
