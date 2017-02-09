require 'rails_helper'

describe Training do
  describe 'associations' do
    it { is_expected.to belong_to :trainor }
    it { is_expected.to belong_to :training_center }
    it { is_expected.to belong_to :competency }
    it { is_expected.to have_many :client_trainings }
    it { is_expected.to have_many :clients }
  end
  describe 'delegations' do
    it { is_expected.to delegate_method(:qualification).to(:competency) }
    it { is_expected.to delegate_method(:name).to(:competency) }

  end
end 
