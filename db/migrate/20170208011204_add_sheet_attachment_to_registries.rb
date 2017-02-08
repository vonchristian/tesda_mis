class AddSheetAttachmentToRegistries < ActiveRecord::Migration[5.0]
  def up
   add_attachment :registries, :spreadsheet
 end

 def down
   remove_attachment :registries, :spreadsheet
 end
end
