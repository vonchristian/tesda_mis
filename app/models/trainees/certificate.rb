module Trainees
  class Certificate < ApplicationRecord
    belongs_to :trainee
    belongs_to :certification_level

    validates :number, presence: true, uniqueness: true
  end
end
