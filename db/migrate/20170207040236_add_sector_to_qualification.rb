class AddSectorToQualification < ActiveRecord::Migration[5.0]
  def change
    add_reference :qualifications, :sector, foreign_key: true
  end
end
