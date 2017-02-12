module Certifications 
  class ExpiredCertificationsController < ApplicationController
    def index 
      if params[:from_date].present? && params[:to_date].present?
        @from_date = DateTime.parse(params[:from_date])
        @to_date =  DateTime.parse(params[:to_date])
        @certifications = Certification.expires_on({from_date: @from_date, to_date: @to_date})
      else
        @certifications = Certification.expired
      end
      respond_to do |format|
        format.pdf do 
          pdf = Certifications::ExpiredCertificationsPdf.new(@certifications, @from_date, @to_date, @view_context)
          send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "Expired Certificates.pdf")
        end 
      end 
    end 
  end 
end 