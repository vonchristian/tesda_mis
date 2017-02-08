require 'rails_helper'

module Clients
  describe Education do
    describe "associations" do
      it { is_expected.to belong_to :client }
      it { is_expected.to belong_to :educational_attainment }
    end
  end
end
