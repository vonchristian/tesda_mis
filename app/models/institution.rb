class Institution < ApplicationRecord
  has_many :accreditations, as: :accredited
  has_many :accredited_services, through: :accreditations, class_name: "InstitutionType", foreign_key: 'institution_type_id'

  validates :name, presence: true
end
