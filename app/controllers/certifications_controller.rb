class CertificationsController < ApplicationController
  before_action :set_certification, only: [:show]
  before_action :set_type
  def index
    if params[:search].present?
      @certifications = type_class.text_search(params[:search]).page(params[:page]).per(50)
    else
      @certifications = type_class.all.page(params[:page]).per(50)
    end
  end

  def show
    @certification = type_class.friendly.find(params[:id])
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
