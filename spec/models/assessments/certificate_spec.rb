require 'rails_helper'
module Assessments
  describe Certificate do
    describe "associations" do
      it { is_expected.to belong_to :certification_level }
      it { is_expected.to belong_to :certified }
      it { is_expected.to have_many :issuances }

    end
    describe "validations" do
      it { is_expected.to validate_presence_of :number }
      it { is_expected.to validate_uniqueness_of :number }
    end
  end
end
