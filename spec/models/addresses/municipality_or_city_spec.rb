require 'rails_helper'
module Addresses
  describe MunicipalityOrCity do
    describe "associations" do
      it { is_expected.to belong_to :province }
      it { is_expected.to have_many :barangays }
      it { is_expected.to have_many :addresses }
      it { is_expected.to have_many :clients }
    end
    describe "validations" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
