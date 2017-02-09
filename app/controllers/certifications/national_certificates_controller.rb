module Certifications 
  class NationalCertificatesController < ApplicationController
    def index 
      if params[:search].present?
        @national_certificates = Certification.text_search(params[:search])
      else 
        @national_certificates = Certifications::NationalCertificate.all 
      end 
    end 

    def show 
      @national_certificate = Certifications::NationalCertificate.find(params[:id])
    end 
  end 
end