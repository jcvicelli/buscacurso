class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :owned_company, only: [:edit, :update, :destroy]

  @category_types = CategoryType.all
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    #@company = Company.new
    @company = current_user.companies.build
    # 3.times { @company.enderecos.build }
  end

  # GET /companies/1/edit
  def edit
    #@company = Company.find(params[:id])
    #@company.enderecos.build
  end

  # POST /companies
  # POST /companies.json
  def create
    #@company = Company.new(company_params)
    @company = current_user.companies.build(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Parceiro criado com sucesso.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Parceiro atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Parceiro apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  def localizar_endereco
    # Classe do brazilian-rails responsavél pela busca de endereco.
    @endereco = BuscaEndereco.cep params[:cep]
    endereco = @endereco.fetch(0)
    numero = @endereco.fetch(1)
    bairro = @endereco.fetch(2)
    estado = @endereco.fetch(3)
    cidade = @endereco.fetch(4)
  end

  private

    def owned_company
      unless current_user.id == @company.user_id || current_user.admin?
        flash[:alert] = "Somente administradores e usuários master podem editar o Parceiro"
        redirect_to root_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:cnpj, :name, :phone, :contact, :email, :site,
                            :user_id, :marketing,  :category_type_ids => [],
                            enderecos_attributes: [:id,:cep, :cidade, :estado,
                            :bairro, :logradouro, :numero, :_destroy])
    end
end
