require 'rails_helper'

module Trainees
  describe Education do
    describe "associations" do
      it {is_expected.to belong_to :trainee }
      it {is_expected.to belong_to :educational_attainment }
    end
  end
end
