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
end
