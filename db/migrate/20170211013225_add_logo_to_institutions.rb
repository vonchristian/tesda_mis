class AddLogoToInstitutions < ActiveRecord::Migration[5.0]
  def up
    add_attachment :institutions, :logo
  end

  def down
    remove_attachment :institutions, :logo
  end
end