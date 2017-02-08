class Sector < ApplicationRecord
  has_many :qualifications
  has_many :competencies, through: :qualifications, class_name: "Qualifications::Competency"
  validates :name, presence: true, uniqueness: true
end
