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
      respond_to do |format|
        format.html 
        format.pdf do 
          pdf = Certifications::NationalCertificatePdf.new(@national_certificate, @view_context)
          send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "#{@national_certificate.number} National Certificate.pdf")
        end
      end
    end 
  end 
end