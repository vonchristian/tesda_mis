class TraineesController < ApplicationController
  def index
    @trainees = Trainee.all
  end
  def new
    @trainee = Trainee.new
  end
  def create
    @trainee = Trainee.create(trainee_params)
    if @trainee.save
      redirect_to @trainee, notice: "saved successfully."
    else
      render :new
    end
  end

  private
  def trainee_params
    params.require(:trainee).permit(:first_name, :middle_name, :last_name, :sex, :date_of_birth, :contact_number)
  end
end 
