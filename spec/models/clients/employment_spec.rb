require 'rails_helper'
module Clients 
  describe Employment do
    describe "associations" do 
      it { is_expected.to belong_to :company }
      it { is_expected.to belong_to :assessor }
    end

    describe "validations" do 
      it { is_expected.to validate_presence_of :designation }
      it { is_expected.to validate_presence_of :company_id }
    end
  end
end
