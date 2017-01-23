require 'rails_helper'

describe Training do
  describe "associations" do
    it { is_expected.to have_one :assessment }
    it { is_expected.to have_many :trainees }
  end
end
