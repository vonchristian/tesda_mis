module Addresses
  class MunicipalityOrCity < ApplicationRecord
    belongs_to :province, class_name: "Addresses::Province"
    has_many :barangays, class_name: "Addresses::Barangay"
    has_many :addresses
    has_many :clients, through: :addresses, source: :addressable, source_type: "Client"

    validates :name, uniqueness: true

  end
end
