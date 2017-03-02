require 'rails_helper'

describe Client do
  describe "associations" do
    it { is_expected.to have_many :completed_trainings }
    it { is_expected.to have_many :trainings }
    it { is_expected.to have_many :educations }
    it { is_expected.to have_many :educational_attainments }
    it { is_expected.to have_many :assessments }
    it { is_expected.to have_many :certifications }
    it { is_expected.to have_many :assessorships }
    it { is_expected.to have_many :trainorships }
    it { is_expected.to have_many :conducted_assessments }
    it { is_expected.to have_many :conducted_trainings }
    it { is_expected.to have_many :addresses }
    it { is_expected.to have_many :national_certificates }
    it { is_expected.to have_many :certificate_of_competencies }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :middle_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe "photo_attachment" do
    it { should have_attached_file(:avatar) }
    it { should validate_attachment_content_type(:avatar).allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
  end

  it '.text_search' do
    client = create(:client, last_name: "Halip")
    client2 = create(:client, last_name: "Dulnuan")
    result = Client.text_search('Halip')

    expect(result).to include(client)
    expect(result).to_not include(client2)
  end

  it '#fullname' do
    client = create(:client, first_name: "Von", middle_name: 'Pinosan', last_name: 'Halip')

    expect(client.full_name).to eql('Von Pinosan Halip')
  end

  it '#last_and_first_name' do
    client = build(:client, first_name: "Von", middle_name: 'Pinosan', last_name: 'Halip')

    expect(client.last_and_first_name).to eql('Halip, Von P.')
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:sex).with([:male, :female]) }
  end

  describe "parse_for_client(record)" do 
    it "with first_name, middle_name and last_name" do 
      record = "Von Christian Pinosan Halip"
      client = Client.parse_for_client(record)

      expect(client.first_name).to eql("Von Christian")
      expect(client.middle_name).to  eql("Pinosan")
      expect(client.last_name).to eql("Halip")
      expect(client.full_name).to eql("Von Christian Pinosan Halip")
    end

    it "with first_name and last_name" do 
      record = "Maria  Halip"
      client = Client.parse_for_client(record)

      expect(client.first_name).to eql("Maria")
      expect(client.last_name).to eql("Halip")
      expect(client.full_name).to eql("Maria Halip Halip")
    end
    it 'with long name ' do 
      record = "Mark Jhon Wade P. Halip"
      client = Client.parse_for_client(record)

      expect(client.first_name).to eql("Mark Jhon Wade")
      expect(client.middle_name).to  eql("P.")
      expect(client.last_name).to eql("Halip")
      expect(client.full_name).to eql("Mark Jhon Wade P. Halip")
    end
  end

end
