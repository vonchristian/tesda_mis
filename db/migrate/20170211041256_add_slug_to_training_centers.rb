class AddSlugToTrainingCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :training_centers, :slug, :string
    add_index :training_centers, :slug, unique: true
  end
end
