require 'rails_helper'

module Configurations
  describe CertificateRevision do
    describe "validations" do 
      it { is_expected.to validate_presence_of :revision_date }
    end
  end
end
