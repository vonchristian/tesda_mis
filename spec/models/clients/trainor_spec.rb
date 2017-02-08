require 'rails_helper'

module Clients
  describe Trainor  do
    describe "associations" do
      it { is_expected.to belong_to :client }
      it { is_expected.to have_one :accreditation }
      it { is_expected.to have_many :conducted_trainings }
    end
  end
end
