module Qualifications
  class Competency < ApplicationRecord
    belongs_to :qualification
    enum competency_type: [:basic, :common, :core]

    # validates :unit_code, presence: true, uniqueness: { scope: :qualification_id }
    validates :unit_title,  uniqueness: { scope: :qualification_id }
    validates :name, presence: true
    validates :qualification_id, presence: true


    delegate :name, to: :qualification, prefix: true, allow_nil: true
    before_save :set_name 
    
    def self.basic_and_common
      self.basic + self.common 
    end

    private 
    def set_name 
      self.name ||= self.unit_title
    end
  end
end
