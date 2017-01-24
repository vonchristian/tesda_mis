class TraineesController < ApplicationController
  def index
    @trainees = Trainee.all
  end
  def new
    @trainee = Trainee.new
    @trainee.build_education
  end
  def create
    @trainee = Trainee.create(trainee_params)
    if @trainee.save
      redirect_to @trainee, notice: "saved successfully."
    else
      render :new
    end
  end
  def show
    @trainee = Trainee.find(params[:id])
  end

  private
  def trainee_params
    params.require(:trainee).permit(:first_name, :middle_name, :last_name, :sex, :date_of_birth, :contact_number, education_attributes: [:educational_attainment_id])
  end
end
