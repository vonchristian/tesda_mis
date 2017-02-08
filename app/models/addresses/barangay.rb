module Addresses
  class Barangay < ApplicationRecord
    belongs_to :municipality_or_city, class_name: "Addresses::MunicipalityOrCity"

    validates :name, presence: true, uniqueness: true

  end
end
