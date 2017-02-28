class AddUserToRegistries < ActiveRecord::Migration[5.0]
  def change
    add_reference :registries, :user, foreign_key: true
  end
end
