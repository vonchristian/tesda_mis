module Clients 
  class EducationsController < ApplicationController
    def new 
      @assessor = Clients::Assessor.find(params[:assessor_id])
      @education = @assessor.educations.build 
    end 
    def create
      @assessor = Clients::Assessor.find(params[:assessor_id])
      @education = @assessor.educations.create(education_params)
      if @education.save 
        redirect_to assessor_url(@assessor), notice: "saved successfully"
      else 
        render :new 
      end 
    end 

    private 
    def education_params
      params.require(:clients_education).permit(:educational_attainment_id)
    end 
  end 
end