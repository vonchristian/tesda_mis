class CertificationsController < ApplicationController
  def index
    if params[:search].present?
      @certifications = Certification.text_search(params[:search])
    else
      @certifications = Certification.all
    end
  end

  def show
    @certification = Certification.find(params[:id])
  end
end 
