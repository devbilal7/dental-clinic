class ProsthodonticMastersController < ApplicationController
  layout "dashboard"
  before_action :set_prosthodontic_master, only: %i[ show edit update destroy ]

  # GET /prosthodontic_masters or /prosthodontic_masters.json
  def index
    @prosthodontic_masters = ProsthodonticMaster.all
  end

  # GET /prosthodontic_masters/1 or /prosthodontic_masters/1.json
  def show
  end

  # GET /prosthodontic_masters/new
  def new
    @prosthodontic_master = ProsthodonticMaster.new
  end

  # GET /prosthodontic_masters/1/edit
  def edit
  end

  # POST /prosthodontic_masters or /prosthodontic_masters.json
  def create
    @prosthodontic_master = ProsthodonticMaster.new(prosthodontic_master_params)

    respond_to do |format|
      if @prosthodontic_master.save
        format.html { redirect_to master_admin_admin_managements_path(tab: "button-prosthodontics"), notice: "Prosthodontic master was successfully created." }
        format.json { render :show, status: :created, location: @prosthodontic_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prosthodontic_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prosthodontic_masters/1 or /prosthodontic_masters/1.json
  def update
    respond_to do |format|
      if @prosthodontic_master.update(prosthodontic_master_params)
        format.html { redirect_to prosthodontic_master_url(@prosthodontic_master), notice: "Prosthodontic master was successfully updated." }
        format.json { render :show, status: :ok, location: @prosthodontic_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prosthodontic_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prosthodontic_masters/1 or /prosthodontic_masters/1.json
  def destroy
    @prosthodontic_master.destroy

    respond_to do |format|
      format.html { redirect_to prosthodontic_masters_url, notice: "Prosthodontic master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prosthodontic_master
      @prosthodontic_master = ProsthodonticMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prosthodontic_master_params
      params.require(:prosthodontic_master).permit(:prosthodontic_code, :prosthodontic_name, :remarks, :master_name)
    end
end
