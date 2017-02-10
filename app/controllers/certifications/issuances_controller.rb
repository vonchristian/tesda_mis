module Certifications 
  class IssuancesController < ApplicationController 
    def new 
      @certification = Certification.find(params[:certification_id])
      @issuance = @certification.issuances.build 
    end 
    def create 
      @certification = Certification.find(params[:certification_id])
      @issuance = @certification.issuances.create(issuance_params)
      if @issuance.save 
        redirect_to @issuance, notice: "issued successfully."
      else 
        render :new 
      end 
    end 

    def show 
      @issuance = Issuance.find(params[:id])
    end

    private 
    def issuance_params 
      params.require(:issuance).permit(:reference_number, :issue_date)
    end 
  end 
end 