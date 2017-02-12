module Certifications 
  class ExpiredCertificationsController < ApplicationController
    def index 
      @certifications = Certification.expired
      respond_to do |format|
        format.pdf do 
          pdf = Certifications::ExpiredCertificationsPdf.new(@certifications, @view_context)
          send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "Expired Certificates.pdf")
        end 
      end 
    end 
  end 
end 