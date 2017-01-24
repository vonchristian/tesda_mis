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
  end
  private
  def certificate_params
    params.require(:assessments_certificate).permit(:number)
  end
end
