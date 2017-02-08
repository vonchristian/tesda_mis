class AddCertificationTypeToCertification < ActiveRecord::Migration[5.0]
  def change
    add_reference :certifications, :certification_type, foreign_key: true
  end
end
