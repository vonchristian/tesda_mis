class Region < ApplicationRecord
  has_many :provinces, class_name: "Regions::Province"

  validates :name, presence: true, uniqueness: true
end
