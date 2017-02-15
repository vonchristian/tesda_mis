require 'rails_helper'

describe Training do
  describe 'associations' do
    it { is_expected.to belong_to :trainor }
    it { is_expected.to belong_to :training_center }
    it { is_expected.to belong_to :qualification }
    it { is_expected.to have_many :client_trainings }
    it { is_expected.to have_many :clients }
  end
  describe 'delegations' do
  end
end 
