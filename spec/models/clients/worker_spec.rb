require 'rails_helper'

module Clients
  describe Worker do
    describe "associations" do 
      it { is_expected.to belong_to :client }
    end 
  end 
end
