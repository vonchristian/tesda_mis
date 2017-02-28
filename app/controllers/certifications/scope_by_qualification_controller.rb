module Certifications 
  class ScopeByQualificationController < ApplicationController
    def index 
      @qualification = Qualification.friendly.find(params[:qualification])
      @certifications = @qualification.certifications 
      respond_to do |format|
        format.pdf do 
          pdf = Certifications::ScopeByQualificationPdf.new(@qualification, @certifications, @view_context)
          send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "certifications.pdf")
        end 
      end 
    end 
  end 
end 
