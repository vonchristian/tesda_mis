require 'rails_helper'

module Assessors
  describe Accreditation do
    describe "associations" do
      it { is_expected.to belong_to :assessor }
      it { is_expected.to belong_to :qualification }
    end
  end
end
