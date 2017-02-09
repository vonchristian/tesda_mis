require 'rails_helper'

module Institutions 
  describe AssessmentCenter do 
    describe "associations" do 
      it { is_expected.to belong_to :institution }
      it { is_expected.to have_many :accreditations }
      it { is_expected.to have_many :accredited_qualifications }
    end 
    describe "delegations" do 
      it { is_expected.to delegate_method(:name).to(:institution) }
    end 
  end 
end 