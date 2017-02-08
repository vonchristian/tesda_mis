module Addresses
  class Region < ApplicationRecord
    has_many :provinces, class_name: "Addresses::Province"

    validates :name, presence: true, uniqueness: true
  end
end
