module Configurations
  class Signatory < ApplicationRecord
    def self.set(certification)
      signatory = all.select{ |a| certification.issue_date.between?(a.term_start_date, a.term_end_date) }.first
      if signatory.present?
        certification.signatory = signatory
        certification.save
      end
    end

    def full_name
      "#{first_name} #{middle_name.try(:first)}. #{last_name}"
    end
  end
end