class AddForeignTablesToCompletedTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :completed_trainings, :region, foreign_key: true
    add_reference :completed_trainings, :province, foreign_key: true
    add_column :completed_trainings, :reference_number, :string
    add_index :completed_trainings, :reference_number
    add_reference :completed_trainings, :modality, foreign_key: true
    add_column :completed_trainings, :client_type_id, :integer
    add_index :completed_trainings, :client_type_id
  end
end
