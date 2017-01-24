class AddEducationalAttainmentToTrainees < ActiveRecord::Migration[5.0]
  def change
    add_reference :trainees, :educational_attainment, foreign_key: true
  end
end
