module Addresses
  class MunicipalityOrCity < ApplicationRecord
    belongs_to :province, class_name: "Addresses::Province"
    has_many :barangays, class_name: "Addresses::Barangay"

    validates :name, presence: true, uniqueness: true

  end
end
