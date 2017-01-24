module Trainees
  class TraineeTrainingsController < ApplicationController
    def new
      @trainee = Trainee.find(params[:trainee_id])
      @training = @trainee.trainee_trainings.build
    end
    def create
      @trainee = Trainee.find(params[:trainee_id])
      @training = @trainee.trainee_trainings.create(training_params)
      if @training.save
        redirect_to @trainee, notice: "created successfully"
      else
        render :new
      end
    end

    def show
      @trainee_training = TraineeTraining.find(params[:id])
    end

    private
    def training_params
      params.require(:trainee_training).permit(:training_id)
    end
  end
end
