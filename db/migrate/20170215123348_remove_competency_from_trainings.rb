class RemoveCompetencyFromTrainings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :trainings, :competency, foreign_key: true
  end
end
