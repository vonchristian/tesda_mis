require 'rails_helper'

describe Assessment do
  describe "associations" do
    it { is_expected.to belong_to :trainee }
    it { is_expected.to belong_to :assessor }
    it { is_expected.to belong_to :training }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :date }
  end
end
