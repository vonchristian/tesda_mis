require 'rails_helper'

describe Issuance do
  describe "associations" do 
    it { is_expected.to belong_to :issuable }
    it { is_expected.to belong_to :issuer }
  end

  describe "validations" do 
    it { is_expected.to validate_presence_of :reference_number }
    it { is_expected.to validate_presence_of :issue_date }
    it { is_expected.to validate_uniqueness_of :reference_number }
  end

  describe "delegations" do 
    it { is_expected.to delegate_method(:client_first_name).to(:issuable)}
    it { is_expected.to delegate_method(:client_middle_name).to(:issuable)}
    it { is_expected.to delegate_method(:client_last_name).to(:issuable)}
    it { is_expected.to delegate_method(:client_full_name).to(:issuable)}
    it { is_expected.to delegate_method(:full_name).to(:issuer).with_prefix }
  end
end
