class RegistriesController < ApplicationController
  def index
    if params[:name].present?
      @registries = Registry.search_by_name(params[:name])
    else
      @registries = Registry.all
    end
  end
  def new
    @registry = Registry.new
  end
  def create
    @registry = Registry.new(registry_params)
    if @registry.save!
      redirect_to registries_url, notice: "uploaded successfully."
    else
      render :new
    end
  end

  def show
    @registry = Registry.find(params[:id])
  end

  private
  def registry_params
    params.require(:registry).permit(:sheet)
  end
end
