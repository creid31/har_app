class HarFilesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_har_file, only: [:show, :edit, :update, :destroy]

  # GET /har_files
  # GET /har_files.json
  def index
    @har_files = HarFile.all
  end

  # GET /har_files/1
  # GET /har_files/1.json
  def show
  end

  # GET /har_files/new
  def new
    @har_file = HarFile.new
  end

  # GET /har_files/1/edit
  def edit
  end

  # POST /har_files
  # POST /har_files.json
  def create
    @har_file = HarFile.new(har_file_params)

    respond_to do |format|
      if @har_file.save
        format.html { redirect_to @har_file, notice: 'Har file was successfully created.' }
        format.json { render :show, status: :created, location: @har_file }
      else
        format.html { render :new }
        format.json { render json: @har_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /har_files/1
  # PATCH/PUT /har_files/1.json
  def update
    respond_to do |format|
      if @har_file.update(har_file_params)
        format.html { redirect_to @har_file, notice: 'Har file was successfully updated.' }
        format.json { render :show, status: :ok, location: @har_file }
      else
        format.html { render :edit }
        format.json { render json: @har_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /har_files/1
  # DELETE /har_files/1.json
  def destroy
    @har_file.destroy
    respond_to do |format|
      format.html { redirect_to har_files_url, notice: 'Har file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_har_file
      @har_file = HarFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def har_file_params
      params.require(:har_file).permit(:name, :description, :content)
    end
end
