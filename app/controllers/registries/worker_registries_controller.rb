module Registries  
  class WorkerRegistriesController < ApplicationController
    def index
      if params[:search].present?
        @registries = Registries::WorkerRegistry.text_search(params[:search])
      else
        @registries = Registries::WorkerRegistry.all
      end
    end

    def new
      @registry = Registries::WorkerRegistry.new
    end
    def create
      @registry = Registries::WorkerRegistry.create(registry_params)
      @registry.uploader = current_user
      if @registry.save
        redirect_to worker_registries_url, notice: "RWAC uploaded successfully."
      else
        render :new
      end
    end

    def show
      @registry = Registries::WorkerRegistry.find(params[:id])
    end

    private
    def registry_params
      params.require(:registries_worker_registry).permit(:name, :spreadsheet, :date)
    end
  end
end