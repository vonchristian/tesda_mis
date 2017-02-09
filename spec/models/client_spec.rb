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
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :middle_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  it '.text_search' do
    client = create(:client, last_name: "Halip")
    client2 = create(:client, last_name: "Dulnuan")
    result = Client.text_search('Halip')

    expect(result).to include(client)
    expect(result).to_not include(client2)
  end

  it '#full_name' do
    client = build(:client, first_name: "Von", middle_name: 'Pinosan', last_name: 'Halip')

    expect(client.full_name).to eql('Von P. Halip')
  end

  it '#last_and_first_name' do
    client = build(:client, first_name: "Von", middle_name: 'Pinosan', last_name: 'Halip')

    expect(client.last_and_first_name).to eql('Halip, Von P.')
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:sex).with([:male, :female]) }
  end

end
