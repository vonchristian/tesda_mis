require 'rails_helper'

describe Issuance do
  describe "associations" do 
    it { is_expected.to belong_to :issuable }
  end

  describe "validations" do 
    it { is_expected.to validate_presence_of :reference_number }
    it { is_expected.to validate_presence_of :issue_date }
    it { is_expected.to validate_uniqueness_of :reference_number }
  end
end
