class AddRegistryToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessments, :registry, foreign_key: true
  end
end
