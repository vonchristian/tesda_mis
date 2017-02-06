class CertificatesController < ApplicationController
  def index
    @certificates = Assessments::Certificate.all
  end
  def new
    @assessment = Assessment.find(params[:assessment_id])
    @certificate = @assessment.build_certificate
  end
  def create
    @assessment = Assessment.find(params[:assessment_id])
    @certificate = @assessment.create_certificate(certificate_params)
    if @certificate.save
      redirect_to certificate_path(@certificate), notice: 'created successfully'
    else
      render :new
    end
  end
  def show
    @certificate = Assessments::Certificate.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Certificates::NationalCertificatePdf.new(@certificate, view_context)
          send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Certificate No. #{@certificate.number}.pdf"
      end
    end
  end
  private
  def certificate_params
    params.require(:assessments_certificate).permit(:number)
  end
end
