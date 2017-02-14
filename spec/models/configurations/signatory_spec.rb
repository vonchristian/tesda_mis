require 'rails_helper'
module Configurations
  describe Signatory do
    describe "associations" do 
    end

    describe "validations" do 
      it { is_expected.to validate_presence_of :first_name }
      it { is_expected.to validate_presence_of :middle_name }
      it { is_expected.to validate_presence_of :last_name }
      it { is_expected.to validate_presence_of :designation }
      it { is_expected.to validate_presence_of :term_start_date }
      it { is_expected.to validate_presence_of :term_end_date }
    end

    it ".set(certification" do 
      certification = create(:certification, issue_date: Date.today.years_ago(2))
      signatory = create(:signatory, term_start_date: Date.today.years_ago(5), term_end_date: Date.today)

      Configurations::Signatory.set(certification)

      expect(certification.signatory).to eql(signatory)
    end

    it '#full_name' do
      signatory = build(:signatory, first_name: "Von", middle_name: 'Pinosan', last_name: 'Halip')

      expect(signatory.full_name).to eql('Von P. Halip')
    end
  end
end
