class Qualification < ApplicationRecord
  has_many :competencies, class_name: 'Qualifications::Competency'
end
