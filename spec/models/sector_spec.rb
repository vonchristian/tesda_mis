require 'rails_helper'

RSpec.describe Sector, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
