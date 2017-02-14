class AddSignatureToSignatories < ActiveRecord::Migration[5.0]
  def up
    add_attachment :signatories, :signature
  end

  def down
    remove_attachment :signatories, :signature
  end
end