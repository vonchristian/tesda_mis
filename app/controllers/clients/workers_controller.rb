module Clients 
  class WorkersController < ApplicationController 
    def index 
      if params[:search].present?
        @workers = Client.text_search(params[:search])
      else
        @workers = Clients::Worker.all 
      end
    end 
    def new 
      @worker = Clients::Worker.new 
    end 
    def create 
      @worker = Clients::Worker.create(worker_params)
      if @worker.save 
        redirect_to @worker, notice: "saved successfully."
      else 
        render :new 
      end
    end
    def show 
      @worker = Clients::Worker.friendly.find(params[:id])
    end

    private 
    def worker_params
      params.require(:clients_worker).permit(:first_name, :middle_name, :last_name, :sex, :date_of_birth)
    end
  end
end