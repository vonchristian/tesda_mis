require 'rails_helper'

describe Certification, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :certified }
    it { is_expected.to belong_to :certification_level }
    it { is_expected.to have_many :issuances }
  end

  describe "delegations" do 
    it { is_expected.to delegate_method(:client).to(:certified) }
    it { is_expected.to delegate_method(:full_name).to(:client).with_prefix }
    it { is_expected.to delegate_method(:qualification).to(:certified) }
    it { is_expected.to delegate_method(:name).to(:qualification).with_prefix }
    it { is_expected.to delegate_method(:level).to(:certification_level).with_prefix }
    it { is_expected.to delegate_method(:assessor).to(:certified) }
    it { is_expected.to delegate_method(:assessee).to(:certified) }
    it { is_expected.to delegate_method(:full_name).to(:assessee).with_prefix }
    it { is_expected.to delegate_method(:full_name).to(:assessor).with_prefix }
  end
end
