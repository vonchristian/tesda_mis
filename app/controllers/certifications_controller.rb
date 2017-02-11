class CertificationsController < ApplicationController
  before_action :set_certification, only: [:show]
  before_action :set_type
  def index
    if params[:search].present?
      @certifications = type_class.text_search(params[:search])
    else
      @certifications = type_class.all
    end
  end

  def show
    @certification = type_class.friendly.find(params[:id])
    respond_to do |format|
      format.html 
      format.pdf do 
        if @certification.national_certificate?
            pdf = Certifications::NationalCertificatePdf.new(@certification, @view_context)
            send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "#{@certification.number} National Certificate.pdf")
        elsif @certification.certificate_of_competency?
          pdf = Certifications::CertificateOfCompetencyPdf.new(@certification, @view_context)
            send_data(pdf.render, type: "application/pdf", disposition: "inline", file_name: "#{@certification.number} Certificate Of Competency.pdf")
        end
      end
    end
  end

  private 
  def set_type 
    @type = type 
  end 
  def type 
    Certification.types.include?(params[:type]) ? params[:type] : "Certification"
  end 
  def type_class
    type.constantize
  end
  def set_certification 
    @certification = type_class.friendly.find(params[:id])
  end

end 
