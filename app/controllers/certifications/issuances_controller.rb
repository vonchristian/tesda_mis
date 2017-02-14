module Certifications 
  class IssuancesController < ApplicationController 
    def new 
      @certification = Certification.friendly.find(params[:certification_id])
      @issuance = @certification.issuances.build 
    end 
    def create 
      @certification = Certification.friendly.find(params[:certification_id])
      @issuance = @certification.issuances.create(issuance_params)
      @issuance.issuable = @certification
      if @issuance.save 
        redirect_to certification_url(@issuance.issuable), notice: "issued successfully."
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