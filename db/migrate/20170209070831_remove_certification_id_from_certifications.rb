class RemoveCertificationIdFromCertifications < ActiveRecord::Migration[5.0]
  def change
    remove_reference :certifications, :certification_type, foreign_key: true
  end
end
