class AddAvatarToTrainees < ActiveRecord::Migration[5.0]
  def up
    add_attachment :trainees, :avatar
  end

  def down
    remove_attachment :trainees, :avatar
  end
end
