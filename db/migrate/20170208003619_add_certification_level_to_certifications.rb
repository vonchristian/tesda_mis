class AddCertificationLevelToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :certifications, :certification_level, foreign_key: true
  end
end
