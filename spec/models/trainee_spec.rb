require 'rails_helper'

RSpec.describe Trainee, type: :model do
  describe "associations" do
    it { is_expected.to have_one :educational_attainment }
    it { is_expected.to have_many :trainee_trainings }
    it { is_expected.to have_many :trainings }
  end
  describe "validations" do
    it { is_expected. to validate_presence_of :first_name }
    it { is_expected. to validate_presence_of :middle_name }
    it { is_expected. to validate_presence_of :last_name }
  end
  describe "nested_attributes" do
    it do
      is_expected.to accept_nested_attributes_for(:education)
    end
  end 
end
