class ClientsController < ApplicationController
  def index
    if params[:search].present?
      @clients = Client.text_search(params[:search]).page(params[:page]).per(10)
    else
      @clients = Client.all.order(:last_name).page(params[:page]).per(10)
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

  private
  def client_params
    params.require(:client).permit(:first_name, :middle_name, :last_name, :sex, :date_of_birth)
  end
end
