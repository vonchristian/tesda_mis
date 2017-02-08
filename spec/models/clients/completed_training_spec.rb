require 'rails_helper'

module Clients
  describe CompletedTraining do
    describe "associations" do
      it { is_expected.to belong_to :client }
      it { is_expected.to belong_to :training }
      it { is_expected.to belong_to :region }
      it { is_expected.to belong_to :province }
      it { is_expected.to belong_to :modality }
      it { is_expected.to belong_to :registry }
      it { is_expected.to belong_to :client_type }
    
    end
  end
end
