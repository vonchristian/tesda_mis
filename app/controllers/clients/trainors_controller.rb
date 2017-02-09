module Clients 
  class TrainorsController < ApplicationController 
    def index 
      if params[:search].present?
        @trainors = Client.text_search(params[:search])
      else 
        @trainors = Clients::Trainor.all 
      end 
    end 

    def show 
      @trainor = Clients::Trainor.find(params[:id])
    end 
  end 
end 