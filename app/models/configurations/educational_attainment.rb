module Configurations
  class EducationalAttainment < ApplicationRecord
    has_many :educations, class_name: "Clients::Education"
    has_many :clients, through: :educations
  end
end
