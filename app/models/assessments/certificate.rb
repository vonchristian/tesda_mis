module Assessments
  class Certificate < ApplicationRecord
    belongs_to :certified, polymorphic: true
    belongs_to :trainee
    belongs_to :certification_level
    has_many :issuances, class_name: "Certificates::Issuance"

    validates :number, presence: true, uniqueness: true
    delegate :name, to: :certified, prefix: true, allow_nil: true
  end
end
