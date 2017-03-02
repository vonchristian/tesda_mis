module Configurations
  class Signatory < ApplicationRecord
    validates :first_name, :middle_name, :last_name, :designation, :term_start_date, :term_end_date, presence: true
    has_attached_file :signature,
      styles: { large: "120x120>",
            medium: "70x70>",
            thumb: "40x40>",
            small: "30x30>",
            x_small: "20x20>"},
      default_url: ":style/profile_default.jpg",
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
  validates_attachment_content_type :signature, content_type: /\Aimage\/.*\Z/
    
    def self.set(certification)
      if certification.issue_date.present?
        signatory = all.select{ |a| certification.issue_date.between?(a.term_start_date, a.term_end_date) }.first
        if signatory.present?
          certification.signatory = signatory
        end
      end
    end

    def full_name
      "#{first_name} #{middle_name.try(:first)}. #{last_name}"
    end
  end
end