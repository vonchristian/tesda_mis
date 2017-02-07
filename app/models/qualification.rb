class Qualification < ApplicationRecord
  belongs_to :sector
  has_many :competencies, class_name: 'Qualifications::Competency'
end
