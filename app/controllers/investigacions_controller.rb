class InvestigacionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_investigacion, only: %i[ show edit update destroy ]

  # GET /investigacions or /investigacions.json
  def index
    @investigacions = Investigacion.all
  end

  # GET /investigacions/1 or /investigacions/1.json
  def show
  end

  # GET /investigacions/new
  def new
    @investigacion = Investigacion.new
  end

  # GET /investigacions/1/edit
  def edit
  end

  # POST /investigacions or /investigacions.json
  def create
    @investigacion = Investigacion.new(investigacion_params)
    respond_to do |format|
      if @investigacion.save
        format.html { redirect_to investigacion_url(@investigacion), notice: "Investigacion was successfully created." }
        format.json { render :show, status: :created, location: @investigacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @investigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investigacions/1 or /investigacions/1.json
  def update
    respond_to do |format|
      if @investigacion.update(investigacion_params)
        format.html { redirect_to investigacion_url(@investigacion), notice: "Investigacion was successfully updated." }
        format.json { render :show, status: :ok, location: @investigacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @investigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investigacions/1 or /investigacions/1.json
  def destroy
    @investigacion.destroy

    respond_to do |format|
      format.html { redirect_to investigacions_url, notice: "Investigacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigacion
      @investigacion = Investigacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def investigacion_params
      params.require(:investigacion).permit(:name, :date, :title, :resume)
    end
end
