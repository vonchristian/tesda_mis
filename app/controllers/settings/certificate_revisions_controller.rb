module Settings 
  class CertificateRevisionsController < ApplicationController 
    def index
      @revisions = Configurations::CertificateRevision.all 
    end 
    def new 
      @revision = Configurations::CertificateRevision.new 
    end 
    def create
      @revision = Configurations::CertificateRevision.create(certificate_revision_params)
      if @revision.save 
        redirect_to settings_certificate_revisions_url, notice: "saved successfully"
      else 
        render :new 
      end 
    end 

    private 
    def certificate_revision_params
      params.require(:configurations_certificate_revision).permit(:revision_date)
    end
  end 
end 