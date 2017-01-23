require 'rails_helper'

describe Regions::Province do
  describe "associations" do
    it { is_expected.to belong_to :region }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
