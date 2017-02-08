require 'rails_helper'

describe Qualification do
  describe "associations" do
    it { is_expected.to belong_to :sector }
    it { is_expected.to have_many :competencies }
    it { is_expected.to have_many :accreditations }
    it { is_expected.to have_many :accredited_clients }
    it { is_expected.to have_many :accredited_institutions }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:sector).with_prefix }
  end
end
