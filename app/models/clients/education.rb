module Clients
  class Education < ApplicationRecord
    belongs_to :educationship, polymorphic: true #can belong to client, assessor
    belongs_to :client
    belongs_to :educational_attainment, class_name: "Configurations::EducationalAttainment"
  end
end
