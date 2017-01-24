require 'rails_helper'

describe Assessment do
  describe "associations" do
    it { is_expected.to belong_to :trainee }
    it { is_expected.to belong_to :assessor }
    it { is_expected.to belong_to :trainee_training }
    it { is_expected.to have_one :certificate }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :application_date }
    it { is_expected.to validate_presence_of :assessment_date }

  end
end
