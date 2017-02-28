module Settings 
  class EmployeesController < ApplicationController
    def index 
      @employees = User.all 
    end 
    def new 
      @employee = User.new 
    end 
    def create
      @employee = User.create(employee_params)
      if @employee.save 
        redirect_to settings_employee_url(@employee), notice: "Employee registered successfully."
      else 
        render :new 
      end 
    end 

    def show 
      @employee = User.friendly.find(params[:id])
    end

    def edit 
      @employee = User.friendly.find(params[:id])
    end

    def update 
      @employee = User.friendly.find(params[:id])
      @employee.update(employee_params)
      if @employee.save 
        redirect_to settings_employee_url(@employee), notice: "Employee updated successfully."
      else 
        render :edit 
      end 
    end 

    private 
    def employee_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :middle_name, :last_name, :designation, :avatar)
    end 
  end 
end 