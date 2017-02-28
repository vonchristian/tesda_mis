module Clients  
  class AddressesController < ApplicationController
    def new 
      @client = Client.friendly.find(params[:client_id])
      @address = @client.addresses.build 
    end 
    def create 
      @client = Client.friendly.find(params[:client_id])
      @address = @client.addresses.create(address_params)
      if @address.save 
        redirect_to client_url(@client), notice: "saved successfully"
      else 
        render :new 
      end 
    end 
    def edit 
      @address = Address.find(params[:id])
    end
    def update 
      @address = Address.find(params[:id])
      @address.update(address_params)
      if @address.save 
        redirect_to client_url(@address.addressable), notice: "Address updated successfully."
      else 
        render :edit 
      end 
    end 

    private 
    def address_params 
      params.require(:address).permit(:region_id, :province_id, :municipality_or_city_id, :street, :current, :barangay_id)
    end 
    def set_type 
    @type = type 
  end 
  def type 
    Certification.types.include?(params[:type]) ? params[:type] : "Certification"
  end 
  def type_class
    type.constantize
  end
  def set_certification 
    @certification = type_class.friendly.find(params[:id])
  end
  end 
end