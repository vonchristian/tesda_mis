module Configurations
  class CertificateRevision < ApplicationRecord
    validates :revision_date, presence: true
  end
end