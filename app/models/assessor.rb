class Assessor < ApplicationRecord
  has_many :accreditations, class_name: "Assessors::Accreditation"
  has_many :qualifications, through: :accreditations

  validates :first_name, :middle_name, :last_name, presence: true

  def full_name
    "#{last_name}, #{first_name} #{middle_name.first}."
  end
end
