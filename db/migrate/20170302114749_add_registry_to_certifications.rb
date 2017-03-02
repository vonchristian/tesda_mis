class AddRegistryToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :certifications, :registry, foreign_key: true
  end
end
