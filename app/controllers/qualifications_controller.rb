class QualificationsController < ApplicationController
  def index 
    if params[:search].present?
      @qualifications = Qualification.text_search(params[:search])
    else
      @qualifications = Qualification.all
    end
  end
  def new 
    @qualification = Qualification.new 
  end 
  def create 
    @qualification = Qualification.create(qualification_params)
    if @qualification.save 
      redirect_to qualifications_url, notice: "saved successfully"
    else 
      render :new 
    end 
  end 

  def show 
    @qualification = Qualification.friendly.find(params[:id])
  end
  private 
  def qualification_params
    params.require(:qualification).permit(:name, :sector_id)
  end
end 