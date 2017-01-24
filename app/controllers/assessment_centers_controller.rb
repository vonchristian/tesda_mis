class AssessmentCentersController < ApplicationController
  def index
    @assessment_centers = AssessmentCenter.all
  end
  def new
    @assessment_center = AssessmentCenter.new
  end
  def create
    @assessment_center = AssessmentCenter.create(assessment_center_params)
    if @assessment_center.save
      redirect_to @assessment_center, notice: "saved successfully."
    else
      render :new
    end
  end

  private
  def assessment_center_params
    params.require(:assessment_center).permit(:name)
  end
end
