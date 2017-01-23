class AddCertificationLevelToCertificates < ActiveRecord::Migration[5.0]
  def change
    add_reference :certificates, :certification_level, foreign_key: true
  end
end
