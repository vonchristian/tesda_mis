class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end
  def new
    @training = Training.new
  end
  def create
    @training = Training.create(training_params)
    if @training.save
      redirect_to trainings_url, notice: "created successfully."
    else
      render :new
    end
  end
  private
  def training_params
    params.require(:training).permit(:competency_id)
  end
end 
