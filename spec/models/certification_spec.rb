require 'rails_helper'

describe Certification, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :certified }
    it { is_expected.to belong_to :certification_type }
    it { is_expected.to belong_to :certification_level }
  end
end
