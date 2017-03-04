require 'rails_helper'
#
module Qualifications
  describe Competency do
    describe "associations" do
      it { is_expected.to belong_to :qualification }
    end

    describe 'validations' do
      # it { is_expected.to validate_presence_of :unit_title }
      # it { is_expected.to validate_presence_of :unit_code }
      # it { is_expected.to validate_uniqueness_of(:unit_code).scoped_to(:qualification_id) }
      it { is_expected.to validate_uniqueness_of(:unit_title).scoped_to(:qualification_id) }
    end

    describe "delegations" do
      it { is_expected.to delegate_method(:name).to(:qualification).with_prefix }
    end

    describe "enums" do 
      it { is_expected.to define_enum_for(:competency_type).with([:basic, :common, :core]) }
    end

    it ".basic_and_common" do 
      basic_competency = create(:competency, competency_type: 0)
      common_competency = create(:competency, competency_type: 1)
      core_competency = create(:competency, competency_type: 2)

      expect(Qualifications::Competency.basic_and_common).to include(basic_competency)
      expect(Qualifications::Competency.basic_and_common).to include(common_competency)
      expect(Qualifications::Competency.basic_and_common).to_not include(core_competency)
    end
  end
end
