class AddCompetencyToCertifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :certifications, :competency, foreign_key: true
  end
end
