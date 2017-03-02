require 'rails_helper'

module Clients
  describe Assessor do
    describe "associations" do
      it { is_expected.to belong_to :client }
      it { is_expected.to belong_to :assessment_center  }
      it { is_expected.to have_many :accreditations }
      it { is_expected.to have_many :employments }
      it { is_expected.to have_many :conducted_assessments }
      it { is_expected.to have_many :accredited_qualifications }
      it { is_expected.to have_many :educations }
      it { is_expected.to have_many :addresses }
    end
    describe "delegations" do
      it { is_expected.to delegate_method(:full_name).to(:client)}
      it { is_expected.to delegate_method(:current_address).to(:client)}
      it { is_expected.to delegate_method(:first_name).to(:client)}
      it { is_expected.to delegate_method(:middle_name).to(:client)}
      it { is_expected.to delegate_method(:last_name).to(:client)}
      it { is_expected.to delegate_method(:avatar).to(:client)}
      it { is_expected.to delegate_method(:name).to(:assessment_center).with_prefix }






    end
  end
end
