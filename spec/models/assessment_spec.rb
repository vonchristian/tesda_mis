require 'rails_helper'

describe Assessment do
  describe 'associations' do
    it { is_expected.to belong_to :assessor }
    it { is_expected.to belong_to :assessee }
    it { is_expected.to belong_to :assessment_center }
    it { is_expected.to have_one :certification }
  end
  describe "enums" do
    it { is_expected.to define_enum_for(:result).with([:competent, :not_yet_competent]) }
  end
  describe "delegations" do 
    it { is_expected.to delegate_method(:full_name).to(:assessee).with_prefix }
    it { is_expected.to delegate_method(:full_name).to(:assessor).with_prefix }
  end
end
