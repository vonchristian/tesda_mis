require 'rails_helper'

module Institutions 
  describe AssessmentCenter do 
    describe "associations" do 
      it { is_expected.to belong_to :institution }
      it { is_expected.to belong_to :assessment_center_manager }
      it { is_expected.to have_many :accreditations }
      it { is_expected.to have_many :accredited_qualifications }
      it { is_expected.to have_many :conducted_assessments }
      it { is_expected.to have_many :assessors }
    end 
    describe "delegations" do 
      it { is_expected.to delegate_method(:name).to(:institution) }
      it { is_expected.to delegate_method(:logo).to(:institution) }
      it { is_expected.to delegate_method(:address_details).to(:institution) }
    end 
  end 
end 