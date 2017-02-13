module Clients 
  class EmploymentsController < ApplicationController
    def new 
      @assessor = Clients::Assessor.find(params[:assessor_id])
      @employment = @assessor.employments.build 
    end 
    def create
      @assessor = Clients::Assessor.find(params[:assessor_id])
      @employment = @assessor.employments.create(employment_params)
      if @employment.save 
        redirect_to assessor_url(@assessor), notice: "saved successfully"
      else 
        render :new 
      end 
    end 

    private 
    def employment_params
      params.require(:clients_employment).permit(:designation, :company_id)
    end 
  end 
end