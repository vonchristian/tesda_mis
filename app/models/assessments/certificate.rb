module Assessments
  class Certificate < ApplicationRecord
    belongs_to :certified, polymorphic: true
    belongs_to :trainee
    belongs_to :certification_level

    validates :number, presence: true, uniqueness: true
  end
end
