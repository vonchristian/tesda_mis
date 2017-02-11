class AddClientToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :certifications, :client, foreign_key: true
  end
end
