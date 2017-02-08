require 'rails_helper'
module Certifications
  describe CertificationType do
    describe "associations" do
      it { is_expected.to have_many :certifications }
    end
  end
end
