require 'rails_helper'
module Trainees
  describe Certificate do
    describe "associations" do
      it { is_expected.to belong_to :certification_level }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of :number }
      it { is_expected.to validate_uniqueness_of :number }
    end
  end
end
