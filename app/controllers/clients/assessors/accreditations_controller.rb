module Clients 
  module Assessors
    class AccreditationsController < ApplicationController
      def new 
        @assessor = Clients::Assessor.find(params[:assessor_id])
        @accreditation = @assessor.accreditations.build 
      end 
      def create
        @assessor = Clients::Assessor.find(params[:assessor_id])
        @accreditation = @assessor.accreditations.create(accreditation_params)
        if @accreditation.save 
          redirect_to assessor_url(@assessor), notice: "saved successfully"
        else 
          render :new 
        end 
      end 

      private 
      def accreditation_params
        params.require(:accreditation).permit(:qualification_id, :number, :accreditation_date, :expiry_date)
      end 
    end 
  end 
end 
