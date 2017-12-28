class ExcepsController < ApplicationController
  before_action :set_excep, only: [:show, :edit, :update, :destroy]

  # GET /exceps
  # GET /exceps.json
  def index
    @exceps = Excep.all
  end

  # GET /exceps/1
  # GET /exceps/1.json
  def show
  end

  # GET /exceps/new
  def new
    @excep = Excep.new
  end

  # GET /exceps/1/edit
  def edit
  end

  # POST /exceps
  # POST /exceps.json
  def create
    @excep = Excep.new(excep_params)

    respond_to do |format|
      if @excep.save
        format.html { redirect_to @excep, notice: 'Excep was successfully created.' }
        format.json { render :show, status: :created, location: @excep }
      else
        format.html { render :new }
        format.json { render json: @excep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exceps/1
  # PATCH/PUT /exceps/1.json
  def update
    respond_to do |format|
      if @excep.update(excep_params)
        format.html { redirect_to @excep, notice: 'Excep was successfully updated.' }
        format.json { render :show, status: :ok, location: @excep }
      else
        format.html { render :edit }
        format.json { render json: @excep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exceps/1
  # DELETE /exceps/1.json
  def destroy
    @excep.destroy
    respond_to do |format|
      format.html { redirect_to exceps_url, notice: 'Excep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excep
      @excep = Excep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def excep_params
      params.require(:excep).permit(:part)
    end
end
