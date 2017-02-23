module Configurations
  class CertificationLevel < ApplicationRecord
    validates :level, presence: true, uniqueness: true
  end
end
