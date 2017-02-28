module Clients 
  class ScopeByQualificationController < ApplicationController
    def index 
      @qualification = Qualification.friendly.find(params[:qualification])
      @clients = @qualification.clients 
      respond_to do |format|
        format.pdf do 
          pdf = Clients::ScopeByQualificationPdf.new(@qualification, @clients, @view_context)
          send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "Clients.pdf")
        end 
      end 
    end 
  end 
end 
