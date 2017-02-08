class RegistriesController < ApplicationController
  def index
    if params[:search].present?
      @registries = Registry.text_search(params[:search])
    else
      @registries = Registry.all
    end
  end

  def new
    @registry = Registry.new
  end
  def create
    @registry = Registry.create(registry_params)
    if @registry.save
      redirect_to @registry, notice: "uploaded successfully."
    else
      render :new
    end
  end

  def show
    @registry = Registry.find(params[:id])
  end

  private
  def registry_params
    params.require(:registry).permit(:name, :spreadsheet, :date)
  end
end
