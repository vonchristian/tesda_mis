require 'rails_helper'

describe Qualification do
  describe "associations" do
    it { is_expected.to have_many :competencies }
  end
end
