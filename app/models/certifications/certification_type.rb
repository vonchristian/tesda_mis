module Certifications
  class CertificationType < ApplicationRecord
    has_many :certifications
  end
end
