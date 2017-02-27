module Qualifications
  class Competency < ApplicationRecord
    belongs_to :qualification
    enum competency_type: [:basic, :common, :core]

    # validates :unit_code, presence: true, uniqueness: { scope: :qualification_id }
    validates :unit_title, presence: true, uniqueness: { scope: :qualification_id }


    delegate :name, to: :qualification, prefix: true, allow_nil: true
    def name 
      unit_title
    end
    def self.basic_and_common
      self.basic + self.common 
    end
  end
end
