module Certificates
  class IssuancesController < ApplicationController
    def new
      @certificate = Assessments::Certificate.find(params[:certificate_id])
      @issuance = @certificate.issuances.build
    end
    def create
      @certificate = Assessments::Certificate.find(params[:certificate_id])
      @issuance = @certificate.issuances.create(issuance_params)
      if @issuance.save
        redirect_to certificate_path(@certificate), notice: "Certifcate issued successfully."
      else
        render :new
      end
    end

    private
    def issuance_params
      params.require(:certificates_issuance).permit(:serial_number, :application_date, :claim_date)
    end
  end
end 
