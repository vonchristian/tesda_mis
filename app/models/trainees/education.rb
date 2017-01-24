module Trainees
  class Education < ApplicationRecord
    belongs_to :trainee
    belongs_to :educational_attainment
  end
end
