class AssessmentsController < ApplicationController
  def index
    @assessments = Assessment.all
  end

  def show
    @assessment = Assessment.find(params[:id])
  end
end
