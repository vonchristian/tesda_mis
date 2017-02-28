require 'rails_helper'

describe Qualification do
  describe "associations" do
    it { is_expected.to belong_to :sector }
    it { is_expected.to have_many :competencies }
    it { is_expected.to have_many :accreditations }
    it { is_expected.to have_many :accredited_assessors }
    it { is_expected.to have_many :accredited_trainors }
    it { is_expected.to have_many :nc_certifieds }
    it { is_expected.to have_many :coc_certifieds }
    it { is_expected.to have_many :clients }
    it { is_expected.to have_many :accredited_assessment_centers }
    it { is_expected.to have_many :accredited_training_centers }

  end
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:sector).with_prefix }
  end
end
