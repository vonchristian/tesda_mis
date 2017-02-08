require 'rails_helper'

module Clients
  describe Assessor do
    describe "associations" do
      it { is_expected.to belong_to :client }
      it { is_expected.to have_many :accreditations }
      it { is_expected.to have_many :conducted_assessments }
    end
  end
end
