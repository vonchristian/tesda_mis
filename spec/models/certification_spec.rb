require 'rails_helper'

describe Certification, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :certified }
    it { is_expected.to belong_to :certification_level }
  end

  describe "delegations" do 
    it { is_expected.to delegate_method(:client).to(:certified) }
    it { is_expected.to delegate_method(:full_name).to(:client).with_prefix }
  end
end
