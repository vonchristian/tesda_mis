require 'rails_helper'

describe Address do
  describe "associations" do
    it { is_expected.to belong_to :province }
    it { is_expected.to belong_to :municipality_or_city }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :addressable }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:barangay).with_prefix }
    it { is_expected.to delegate_method(:name).to(:municipality_or_city).with_prefix }
    it { is_expected.to delegate_method(:name).to(:province).with_prefix }
  end


  it "#details" do
    barangay = create(:barangay, name: "Tukucan")
    municipality_or_city = create(:municipality_or_city, name: "Tinoc")
    province = create(:province, name: "Ifugao")

    address = create(:address, barangay: barangay, municipality_or_city: municipality_or_city, province: province)

    expect(address.details).to eql("Tukucan, Tinoc, Ifugao")
  end
end
