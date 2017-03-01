class CreateCertificateRevisions < ActiveRecord::Migration[5.0]
  def change
    create_table :certificate_revisions do |t|
      t.datetime :revision_date

      t.timestamps
    end
  end
end
