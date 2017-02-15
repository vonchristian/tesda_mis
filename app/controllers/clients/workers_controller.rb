module Clients 
  class WorkersController < ApplicationController 
    def index 
      if params[:search].present?
        @workers = Client.text_search(params[:search])
      else
        @workers = Clients::Worker.all 
      end
    end 
    def show 
      @worker = Clients::Worker.friendly.find(params[:id])
    end
  end
end