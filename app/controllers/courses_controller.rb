class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :search]

  @areas = Area.all
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.page(params[:page])
  end

  # GET /articles/search
  def search
    @courses = Course.search(params[:q]).page(params[:page]).records

    render action: "index"
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Curso criado com sucesso.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Curso atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Curso deletado com sucesso.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :description, :about, :place, :company_id, :rating, :begins_at, :ends_at,
            :total_hours, :mode_id, :certificate_id, :investment, :payment_method, :requirements,
            :content, :keywords, :lecturer_name, :lecturer_resume, :link_inscription, :category_type_id,
            :free, :price, :area_ids => [], enderecos_attributes: [:id,:cep, :cidade, :estado,
              :bairro, :logradouro, :numero, :_destroy])
    end
end
