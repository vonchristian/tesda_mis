require 'rails_helper'

module Clients
  describe Worker do
    describe "associations" do 
      it { is_expected.to belong_to :client }
    end 
    describe "delegations" do 
      it { is_expected.to delegate_method(:full_name).to(:client)}
      it { is_expected.to delegate_method(:last_name).to(:client)}
      it { is_expected.to delegate_method(:first_name).to(:client)}
      it { is_expected.to delegate_method(:avatar).to(:client)}
      it { is_expected.to delegate_method(:current_address).to(:client)}
      it { is_expected.to delegate_method(:contact_number).to(:client)}
      it { is_expected.to delegate_method(:educations).to(:client)}
      it { is_expected.to delegate_method(:certifications).to(:client)}
      it { is_expected.to delegate_method(:national_certificates).to(:client)}
      it { is_expected.to delegate_method(:certificate_of_competencies).to(:client)}
    end
  end 
end
