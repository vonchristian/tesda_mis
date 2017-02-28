module Certifications 
  class IssuancesController < ApplicationController 
    def index 
      if params[:from_date].present? && params[:to_date].present?
        @from_date = DateTime.parse(params[:from_date])
        @to_date =  DateTime.parse(params[:to_date])
        @issuances = Issuance.issued_on({from_date: @from_date, to_date: @to_date})
      elsif params[:search].present?
        @issuances = Issuance.text_search(params[:search]).page(params[:page]).per(50)
      else
        @issuances = Issuance.all.page(params[:page]).per(50)
      end
      respond_to do |format|
        format.html
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
      @issuance.issuer = current_user
      if @issuance.save 
        redirect_to certification_url(@issuance.issuable), notice: "issued successfully."
      else 
        render :new 
      end 
    end 

    def show 
      @issuance = Issuance.find(params[:id])
      respond_to do |format|
        format.html 
        format.pdf do 
          if @issuance.issuable.national_certificate?
            pdf = Certifications::NationalCertificatePdf.new(@issuance.issuable, @view_context)
            send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "#{@issuance.issuable.number} National Certificate.pdf")
          elsif @issuance.issuable.certificate_of_competency?
            pdf = Certifications::CertificateOfCompetencyPdf.new(@issuance.issuable, @view_context)
            send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "#{@issuance.issuable.number} Certificate Of Competency.pdf")
          end
        end
      end
    end

    private 
    def issuance_params 
      params.require(:issuance).permit(:reference_number, :issue_date, :cars_date_received, :printing_date)
    end 
  end 
end 