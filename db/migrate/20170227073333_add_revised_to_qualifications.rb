class AddRevisedToQualifications < ActiveRecord::Migration[5.0]
  def change
    add_column :qualifications, :revised, :boolean, default: false
  end
end
