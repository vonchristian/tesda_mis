require 'rails_helper'

describe Accreditation do
  describe 'associations' do
    it { is_expected.to belong_to :qualification }
    it { is_expected.to belong_to :accredited }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :qualification }
    it { is_expected.to validate_presence_of :accredited }
  end
end
