class RemoveTrainingFromAsssessment < ActiveRecord::Migration[5.0]
  def change
    remove_column :assessments, :training_id, :integer
  end
end
