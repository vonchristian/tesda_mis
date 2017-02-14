module Certifications 
  class IssuancesController < ApplicationController 
    def index 
      if params[:from_date].present? && params[:to_date].present?
        @from_date = DateTime.parse(params[:from_date])
        @to_date =  DateTime.parse(params[:to_date])
        @issuances = Issuance.issued_on({from_date: @from_date, to_date: @to_date})
      else
        @issuances = Issuance.all 
      end
      respond_to do |format|
        format.pdf do 
          pdf = Certifications::IssuedCertificationsPdf.new(@issuances, @from_date, @to_date, @view_context)
          send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "Issued Certificates.pdf")
        end 
      end 
    end
    def new 
      @certification = Certification.friendly.find(params[:certification_id])
      @issuance = @certification.issuances.build 
    end 
    def create 
      @certification = Certification.friendly.find(params[:certification_id])
      @issuance = @certification.issuances.create(issuance_params)
      @issuance.issuable = @certification
      if @issuance.save 
        redirect_to certification_url(@issuance.issuable), notice: "issued successfully."
      else 
        render :new 
      end 
    end 

    def show 
      @issuance = Issuance.find(params[:id])
    end

    private 
    def issuance_params 
      params.require(:issuance).permit(:reference_number, :issue_date)
    end 
  end 
end 