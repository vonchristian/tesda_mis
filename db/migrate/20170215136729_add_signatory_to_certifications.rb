class AddSignatoryToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :certifications, :signatory, foreign_key: true
  end
end
