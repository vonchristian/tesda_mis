module Institutions
  class TrainingCenter < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    belongs_to :institution
    has_many :accreditations, as: :accredited
    has_many :training_qualifications, through: :accreditations, source: :qualification
    has_many :conducted_trainings, class_name: "Training", foreign_key: "training_center_id"
    delegate :name, to: :institution
  end
end
