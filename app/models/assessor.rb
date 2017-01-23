class Assessor < ApplicationRecord
  has_many :accreditations, class_name: "Assessors::Accreditation"
  has_many :qualifications, through: :accreditations

  validates :first_name, :middle_name, :last_name, presence: true

end
