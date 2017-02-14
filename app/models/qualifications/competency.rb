module Qualifications
  class Competency < ApplicationRecord
    belongs_to :qualification
    enum competency_type: [:basic, :common, :core]

    # validates :unit_code, presence: true, uniqueness: { scope: :qualification_id }
    validates :unit_title, presence: true, uniqueness: { scope: :qualification_id }


    delegate :name, to: :qualification, prefix: true
    def name 
      unit_title
    end
  end
end
