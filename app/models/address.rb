class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :province, class_name: "Addresses::Province"
  belongs_to :municipality_or_city, class_name: "Addresses::MunicipalityOrCity"
  belongs_to :barangay, class_name: "Addresses::Barangay"

  delegate :name, to: :barangay, prefix: true, allow_nil: true
  delegate :name, to: :municipality_or_city, prefix: true
  delegate :name, to: :province, prefix: true

  # validates :municipality_or_city, presence: true
  # validates :street, presence: true

  def details
    if street && barangay && municipality_or_city && province
      "#{street}, #{barangay_name}, #{municipality_or_city_name}, #{province_name}"
    elsif barangay && municipality_or_city && province
      "#{barangay_name}, #{municipality_or_city_name}, #{province_name}"
    elsif municipality_or_city && province
      "#{municipality_or_city_name}, #{province_name}"
    end
  end
end
