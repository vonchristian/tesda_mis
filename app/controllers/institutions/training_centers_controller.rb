module Institutions 
  class TrainingCentersController < ApplicationController
    def index 
      if params[:search].present?
        @training_centers = Institution.text_search(params[:search])
      else 
        @training_centers = Institutions::TrainingCenter.all 
      end 
    end 

    def show 
      @training_center = Institutions::TrainingCenter.find(params[:id])
    end
  end 
end 