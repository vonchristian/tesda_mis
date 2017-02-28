require 'rails_helper'

describe Registry do
  describe 'associations' do
    it { is_expected.to belong_to :uploader }
    it { is_expected.to have_many :client_trainings }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :spreadsheet }
  end

end
