module Registries 
  class AssessorRegistriesController < ApplicationController
    def index 
    end 
    def new
      @registry = Registries::AssessorRegistry.new
    end
    def create
      @registry = Registries::AssessorRegistry.create(registry_params)
      if @registry.save
        redirect_to assessor_registry_url(@registry), notice: "uploaded successfully."
      else
        render :new
      end
    end

    def show
      @registry = Registries::AssessorRegistry.find(params[:id])
    end

    private
    def registry_params
      params.require(:registries_assessor_registry).permit(:name, :spreadsheet, :date)
    end
  end
end 