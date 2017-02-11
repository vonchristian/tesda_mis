class AddQualificationToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :certifications, :qualification, foreign_key: true
  end
end
