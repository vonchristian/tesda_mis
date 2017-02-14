require 'rails_helper'

describe AssessmentCenterManager do
  describe "associations" do 
    it { is_expected.to belong_to :client }
    it { is_expected.to have_many :assessment_centers }
  end
end
