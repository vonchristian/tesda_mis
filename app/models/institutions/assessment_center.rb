module Institutions
  class AssessmentCenter < ApplicationRecord
    belongs_to :institution
    has_one :accreditation, as: :accredited
  end
end
