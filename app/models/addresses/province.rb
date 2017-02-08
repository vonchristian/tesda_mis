module Addresses
  class Province < ApplicationRecord
    belongs_to :region, class_name: "Addresses::Region"
    has_many :municipality_or_cities, class_name: "Addresses::MunicipalityOrCity"
    has_many :barangays, through: :municipality_or_cities, class_name: "Addresses::Barangay"

    validates :name, presence: true, uniqueness: true
  end
end
