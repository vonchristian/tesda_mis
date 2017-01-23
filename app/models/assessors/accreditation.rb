module Assessors
  class Accreditation < ApplicationRecord
    belongs_to :qualification
    belongs_to :assessor
  end
end
