require 'rails_helper'
module Trainees
  describe TraineeTraining do
    describe "associations" do
      it { is_expected.to have_one :assessment }
      it { is_expected.to belong_to :trainee }
      it { is_expected.to belong_to :training }
      it { is_expected.to belong_to :region }
    end
    describe "delegations" do
      it { is_expected.to delegate_method(:name).to(:training) }
      it { is_expected.to delegate_method(:qualification).to(:training) }
      it { is_expected.to delegate_method(:name).to(:qualification).with_prefix }
    end
  end
end
