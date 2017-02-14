require 'rails_helper'

describe Company do
  describe "associations" do 
    it { is_expected.to have_many :employees }
  end
end
