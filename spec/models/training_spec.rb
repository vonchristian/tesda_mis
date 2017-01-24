require 'rails_helper'

describe Training do
  describe "associations" do
    it { is_expected.to have_many :trainees }
    it { is_expected.to belong_to :competency }
  end
end
