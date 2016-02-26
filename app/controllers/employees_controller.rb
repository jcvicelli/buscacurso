class EmployeesController < ApplicationController
  before_action :set_company

  def create
    @employee = @company.employees.build(employee_params)
    #@employee.user_id = current_user.id

    if @employee.save
      flash[:success] = "Usuario salvo com sucesso!"
      redirect_to :back
    else
      flash[:alert] = "Problemas ao salvar o usuario"
      render root_path
    end
  end

  def destroy
    @employee = @company.employees.find(params[:id])

    @employee.destroy
    flash[:success] = "Usuario deletado."
    redirect_to :back
  end

  private

  def employee_params
    params.require(:employee).permit(:user_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
