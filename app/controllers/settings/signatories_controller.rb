module Settings 
  class SignatoriesController < ApplicationController
    def index 
      @signatories = Configurations::Signatory.all.order(:term_start_date).reverse
    end 
    def new 
      @signatory = Configurations::Signatory.new 
    end 
    def create 
      @signatory = Configurations::Signatory.create(signatory_params)
      if @signatory.save 
        redirect_to settings_signatories_url, notice: "Signatory saved successfully."
      else 
        render :new 
      end 
    end 

    private 
    def signatory_params 
      params.require(:configurations_signatory).permit(:first_name, :middle_name, :last_name, :term_start_date, :term_end_date, :designation)
    end 
  end 
end 