class InstitutionsController < ApplicationController
  def index
    if params[:search].present?
      @institutions = Institution.text_search(params[:search])
    else
      @institutions = Institution.all
    end
  end
  def new 
    @institution = Institution.new 
  end 
  def create 
    @institution = Institution.create(institution_params)
    if @institution.save 
      redirect_to @institution, notice: "saved successfully"
    else 
      render :new 
    end 
  end 
  def show
    @institution = Institution.friendly.find(params[:id])
  end

  private 
  def institution_params
    params.require(:institution).permit(:name, :logo)
  end 
end
