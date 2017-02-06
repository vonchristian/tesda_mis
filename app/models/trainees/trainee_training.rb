module Trainees
  class TraineeTraining < ApplicationRecord
    has_one :assessment
    belongs_to :trainee
    belongs_to :training
    belongs_to :region
    belongs_to :province, class_name: "Regions::Province"
    belongs_to :modality
    belongs_to :client_type


    delegate :name, to: :training
    delegate :qualification, to: :training
    delegate :name, to: :qualification, prefix: true, allow_nil: true
  end
end
