module Clients
  class Trainor < ApplicationRecord
    belongs_to :client
    has_one :accreditation, as: :accredited
    has_many :conducted_trainings, class_name: "Training"
  end
end
