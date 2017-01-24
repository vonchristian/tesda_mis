require 'rails_helper'

describe TraineeTraining do
  describe "associations" do
    it { is_expected.to belong_to :trainee }
    it { is_expected.to belong_to :training }
  end
end
