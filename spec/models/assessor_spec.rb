require 'rails_helper'

describe Assessor do
  describe "associations" do
    it { is_expected.to have_many :accreditations }
    it { is_expected.to have_many :qualifications }
  end
  describe "validations" do
    it { is_expected. to validate_presence_of :first_name }
    it { is_expected. to validate_presence_of :middle_name }
    it { is_expected. to validate_presence_of :last_name }
  end
end
