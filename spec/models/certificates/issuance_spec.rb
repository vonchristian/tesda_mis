require 'rails_helper'

module Certificates
  describe Issuance do
    describe "associations" do
      it { is_expected.to belong_to :certificate }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of :serial_number }
      it { is_expected.to validate_uniqueness_of :serial_number }
    end
  end
end
