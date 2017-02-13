class CreateAssessorRegistries < ActiveRecord::Migration[5.0]
  def change
    create_table :assessor_registries do |t|

      t.timestamps
    end
  end
end
