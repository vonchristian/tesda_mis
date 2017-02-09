require 'rails_helper'

module Institutions 
  describe TrainingCenter do 
    describe "associations" do 
      it { is_expected.to belong_to :institution }
      it { is_expected.to have_many :accreditations }
      it { is_expected.to have_many :training_qualifications }
      it { is_expected.to have_many :conducted_trainings }
    end 

    describe "delegations" do 
      it { is_expected.to delegate_method(:name).to(:institution) }
    end 
  end 
end 