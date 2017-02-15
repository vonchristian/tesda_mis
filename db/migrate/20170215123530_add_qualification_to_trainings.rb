class AddQualificationToTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainings, :qualification, foreign_key: true
    add_column :trainings, :name, :string
  end
end
