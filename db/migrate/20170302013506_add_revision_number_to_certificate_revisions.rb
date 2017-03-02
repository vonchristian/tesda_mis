class AddRevisionNumberToCertificateRevisions < ActiveRecord::Migration[5.0]
  def change
    add_column :certificate_revisions, :revision_number, :integer
  end
end
