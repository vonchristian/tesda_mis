module Institutions
  class AssessmentCenter < ApplicationRecord
    belongs_to :institution
    has_many :accreditations, as: :accredited
    has_many :accredited_qualifications, through: :accreditations, source: :qualification

    delegate :name, to: :institution
  end
end
