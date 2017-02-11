module Institutions 
  class AssessmentCentersController < ApplicationController
    def index 
      if params[:search].present?
        @assessment_centers = Institution.text_search(params[:search])
      else 
        @assessment_centers = Institutions::AssessmentCenter.all 
      end 
    end 

    def show 
      @assessment_center = Institutions::AssessmentCenter.friendly.find(params[:id])
    end
  end 
end 