class ClientsController < ApplicationController
  def index
    if params[:search].present?
      @clients = Client.text_search(params[:search]).page(params[:page]).per(50)
    else
      @clients = Client.all.order(:last_name).page(params[:page]).per(50)
    end
  end
  def new
    @client = Client.new
  end
  def create
    @client = Client.create(client_params)
    if @client.save
      redirect_to @client, notice: "saved successfully"
    else
      render :new
    end
  end
  def show
    @client = Client.friendly.find(params[:id])
  end

  def edit 
    @client = Client.friendly.find(params[:id])
  end

  def update 
    @client = Client.friendly.find(params[:id])
    @client.update(client_params)
    if @client.save 
      redirect_to @client, notice: "Client updated successfully."
    else 
      render :edit 
    end 
  end 

  private
  def client_params
    params.require(:client).permit(:first_name, :middle_name, :last_name, :sex, :date_of_birth, :avatar)
  end
end
