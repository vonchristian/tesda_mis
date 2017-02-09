require 'rails_helper'

module Institutions 
  describe TrainingCenter do 
    describe "associations" do 
      it { is_expected.to belong_to :institution }
    end 

    describe "delegations" do 
      it { is_expected.to delegate_method(:name).to(:institution) }
    end 
  end 
end 