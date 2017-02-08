require 'rails_helper'

module Addresses
  describe Province do
    describe "associations" do
      it { is_expected.to have_many :municipality_or_cities }
      it { is_expected.to have_many :barangays }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
