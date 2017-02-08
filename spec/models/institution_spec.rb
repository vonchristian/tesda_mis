require 'rails_helper'

describe Institution do
  describe "associations" do
    it { is_expected.to have_many :accreditations }
    it { is_expected.to have_many :accredited_services }
  end
  describe "validations" do
  end
end
