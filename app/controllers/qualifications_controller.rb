class QualificationsController < ApplicationController
  def index
    @qualifications = Qualification.all
  end
  def new
    @qualification = Qualification.new
  end
  def create
    @qualification = Qualification.create(qualification_params)
    if @qualification.save
      redirect_to qualifications_url, notice: "created successfully."
    else
      render :new
    end
  end
  def show
    @qualification = Qualification.find(params[:id])
  end
  private
  def qualification_params
    params.require(:qualification).permit(:name)
  end
end
