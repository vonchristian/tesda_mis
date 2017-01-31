module Trainees
  class Education < ApplicationRecord
    belongs_to :trainee
    belongs_to :educational_attainment

    delegate :title, to: :educational_attainment, allow_nil: true
  end
end
