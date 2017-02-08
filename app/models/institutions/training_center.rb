module Institutions
  class TrainingCenter < ApplicationRecord
    belongs_to :institution
    has_many :accreditations, as: :accredited
  end
end
