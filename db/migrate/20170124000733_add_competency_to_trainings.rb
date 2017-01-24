class AddCompetencyToTrainings < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainings, :competency, foreign_key: true
  end
end
