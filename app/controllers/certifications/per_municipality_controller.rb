module Certifications
  class PerMunicipalityController < ApplicationController 
    def index 
      @municipality = Addresses::MunicipalityOrCity.find(params[:municipality])
      @clients = @municipality.clients
      respond_to do |format|
        format.pdf do
          pdf = Certifications::PerMunicipalityPdf.new( @municipality, @clients, @view_context)
          send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "Expired Certificates.pdf") 
        end 
      end 
    end 
  end 
end 