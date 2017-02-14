class QualificationsController < ApplicationController
  def index 
    if params[:search].present?
      @qualifications = Qualification.text_search(params[:search])
    else
      @qualifications = Qualification.all
    end
  end 
end 