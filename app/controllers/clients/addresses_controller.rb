module Clients  
  class AddressesController < ApplicationController
    def new 
      @assessor = Clients::Assessor.find(params[:assessor_id])
      @address = @assessor.addresses.build 
    end 
    def create 
      @assessor = Clients::Assessor.find(params[:assessor_id])
      @address = @assessor.addresses.create(address_params)
      if @address.save 
        redirect_to assessor_url(@assessor), notice: "saved successfully"
      else 
        render :new 
      end 
    end 

    private 
    def address_params 
      params.require(:address).permit(:region_id, :province_id, :municipality_or_city_id, :street, :current)
    end 
  end 
end