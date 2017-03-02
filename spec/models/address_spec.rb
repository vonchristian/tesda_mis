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

  describe ".parse_address(address, client)" do 
    it 'with street, barangay, municipality and province' do 
      client = create(:client)
      address = "314 Rizal Avenue, Poblacion West, Lagawe, Ifugao"
      Address.parse_address(address, client)

      expect(client.current_address.details).to eql(address)
    end

    it 'with barangay, municipality and province' do 
      client = create(:client)
      address = "Poblacion West, Lagawe, Ifugao"
      Address.parse_address(address, client)

      expect(client.current_address.details).to eql(address)
    end

     it 'municipality and province' do 
      client = create(:client)
      address = "Lagawe, Ifugao"
      Address.parse_address(address, client)

      expect(client.current_address.details).to eql(address)
    end
  end


  describe "#details" do
    it "with street, barangay, municipality and province" do 
      barangay = create(:barangay, name: "Tukucan")
      municipality_or_city = create(:municipality_or_city, name: "Tinoc")
      province = create(:province, name: "Ifugao")

      address = create(:address, street: "Ababba", barangay: barangay, municipality_or_city: municipality_or_city, province: province)

      expect(address.details).to eql("Ababba, Tukucan, Tinoc, Ifugao")
    end

    it "with barangay, municipality and province" do 
      barangay = create(:barangay, name: "Tukucan")
      municipality_or_city = create(:municipality_or_city, name: "Tinoc")
      province = create(:province, name: "Ifugao")

      address = create(:address, street: nil, barangay: barangay, municipality_or_city: municipality_or_city, province: province)

      expect(address.details).to eql("Tukucan, Tinoc, Ifugao")
    end

    it "with municipality and province" do 
      municipality_or_city = create(:municipality_or_city, name: "Tinoc")
      province = create(:province, name: "Ifugao")

      address = create(:address, street: "Ababba", barangay: nil, municipality_or_city: municipality_or_city, province: province)

      expect(address.details).to eql("Tinoc, Ifugao")
    end
  end
end
