require 'rails_helper'
#
module Qualifications
  describe Competency do
    describe "associations" do
      it { is_expected.to belong_to :qualification }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :unit_title }
      # it { is_expected.to validate_presence_of :unit_code }
      # it { is_expected.to validate_uniqueness_of(:unit_code).scoped_to(:qualification_id) }
      it { is_expected.to validate_uniqueness_of(:unit_title).scoped_to(:qualification_id) }
    end

    describe "delegations" do
      it { is_expected.to delegate_method(:name).to(:qualification).with_prefix }
    end

    it "#name" do 
      competency = build(:competency, unit_title: "CHS")

      expect(competency.name).to eql("CHS")
    end
    describe "enums" do 
      it { is_expected.to define_enum_for(:competency_type).with([:basic, :common, :core]) }
    end
  end
end
