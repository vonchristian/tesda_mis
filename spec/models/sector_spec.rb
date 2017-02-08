require 'rails_helper'

describe Sector do
  describe 'associations' do
    it { is_expected.to have_many :qualifications }
    it { is_expected.to have_many :competencies }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end             
