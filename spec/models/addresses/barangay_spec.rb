require 'rails_helper'
module Addresses
  describe Barangay do
    describe "associations" do
      it { is_expected.to belong_to :municipality_or_city }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
