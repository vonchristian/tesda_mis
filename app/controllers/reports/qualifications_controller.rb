module Reports 
  class QualificationsController < ApplicationController
    def index 
      @qualifications = Qualification.all
    end 
  end 
end 