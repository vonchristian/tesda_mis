module Clients
  class Assessor < ApplicationRecord
    belongs_to :client
    has_many :accreditations, as: :accredited
    has_many :conducted_assessments, class_name: "Assessment"
  end
end
