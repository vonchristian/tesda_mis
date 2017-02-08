module Clients
  class Education < ApplicationRecord
    belongs_to :client
    belongs_to :educational_attainment, class_name: "Configurations::EducationalAttainment"
  end
end
