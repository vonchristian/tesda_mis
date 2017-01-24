module TraineeTrainings
  class AssessmentsController < ApplicationController
    def new
      @trainee_training = TraineeTraining.find(params[:trainee_training_id])
      @assessment = @trainee_training.build_assessment
    end
    def create
      @trainee_training = TraineeTraining.find(params[:trainee_training_id])
      @assessment = @trainee_training.create_assessment(assessment_params)
      if @assessment.save
        redirect_to trainee_path(@trainee_training.trainee), notice: "saved successfully"
      else
        render :new
      end
    end

    private
    def assessment_params
      params.require(:assessment).permit(:result, :application_date, :assessment_date)
    end
  end
end  
