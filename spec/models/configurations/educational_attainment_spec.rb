require 'rails_helper'

module Configurations
  describe EducationalAttainment do
    describe "associations" do
      it { is_expected.to have_many :clients }
      it { is_expected.to have_many :educations }
    end
  end
end
