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
  def self.parse_address(address, client)
    if address.present? && address.split(",").count == 5
      Address.find_or_create_by(addressable: client, street: address.split(",").first(2).join.strip, barangay: Addresses::Barangay.find_or_create_by(name: address.split(",").third.strip), municipality_or_city: Addresses::MunicipalityOrCity.find_or_create_by(name: address.split(",").fourth.strip.titleize), province: Addresses::Province.find_or_create_by(name: address.split(",").last.strip))
    elsif address.present? && address.split(",").count == 4
      Address.find_or_create_by(addressable: client, street: address.split(",").first.strip, barangay: Addresses::Barangay.find_or_create_by(name: address.split(",").second.strip), municipality_or_city: Addresses::MunicipalityOrCity.find_or_create_by(name: address.split(",").third.strip.titleize), province: Addresses::Province.find_or_create_by(name: address.split(",").last.strip))
    elsif address.present? && address.split(",").count == 3
      Address.find_or_create_by(addressable: client, barangay: Addresses::Barangay.find_or_create_by(name: address.split(",").first.strip), municipality_or_city: Addresses::MunicipalityOrCity.find_or_create_by(name: address.split(",").second.strip.titleize), province: Addresses::Province.find_or_create_by(name: address.split(",").last.strip))
    elsif  address.present? && address.split(",").count == 2
      Address.find_or_create_by(addressable: client, municipality_or_city: Addresses::MunicipalityOrCity.find_or_create_by(name: address.split(",").first.strip), province: Addresses::Province.find_or_create_by(name: address.split(",").last.strip))
    end
  end
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
