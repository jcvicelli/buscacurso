class EmployeesController < ApplicationController
  before_action :set_company

  def create
    @employee = @company.employees.build(employee_params)
    #@employee.user_id = current_user.id

    if @employee.save
      redirect_to :back
    else
      flash[:alert] = "Problemas ao adicionar o usuario. Email invalido"
      redirect_to :back
    end
  end

  def destroy
    @employee = @company.employees.find(params[:id])

    @employee.destroy
    #flash[:success] = "Usuario deletado."
    redirect_to :back
  end

  private

  def employee_params
    params.require(:employee).permit(:email)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
