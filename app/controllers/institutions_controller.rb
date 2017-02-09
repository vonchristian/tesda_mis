class InstitutionsController < ApplicationController
  def index
    if params[:search].present?
      @institutions = Institution.text_search(params[:search])
    else
      @institutions = Institution.all
    end
  end
  def show
    @institution = Institution.find(params[:id])
  end
end
