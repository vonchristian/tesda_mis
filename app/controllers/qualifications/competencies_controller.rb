module Qualifications 
  class CompetenciesController < ApplicationController
    def new 
      @qualification = Qualification.friendly.find(params[:qualification_id])
      @competency = @qualification.competencies.build
    end 
    def create 
      @qualification = Qualification.friendly.find(params[:qualification_id])
      @competency = @qualification.competencies.create(competency_params)
      if @competency.save 
        redirect_to qualification_url(@qualification), notice: "created successfully"
      else 
        render :new 
      end 
    end

    private
    def competency_params
      params.require(:qualifications_competency).permit(:unit_code, :unit_title, :competency_type)
    end
  end 
end