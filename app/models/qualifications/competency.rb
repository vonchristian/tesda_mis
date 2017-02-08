module Qualifications
  class Competency < ApplicationRecord
    belongs_to :qualification

    validates :unit_code, presence: true, uniqueness: { scope: :qualification_id }
    validates :unit_title, presence: true, uniqueness: { scope: :qualification_id }


    delegate :name, to: :qualification, prefix: true
  end
end
