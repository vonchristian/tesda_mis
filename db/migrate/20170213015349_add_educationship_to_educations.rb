class AddEducationshipToEducations < ActiveRecord::Migration[5.0]
  def change
    add_column :educations, :educationship_id, :integer
    add_index :educations, :educationship_id
    add_column :educations, :educationship_type, :string
    add_index :educations, :educationship_type
  end
end
