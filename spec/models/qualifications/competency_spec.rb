require 'rails_helper'

module Qualifications
  describe Competency do
    describe "associations" do
      it { is_expected.to belong_to :qualification }
    end
  end
end
