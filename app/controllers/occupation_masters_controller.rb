class OccupationMastersController < ApplicationController
  layout "dashboard"
  before_action :set_occupation_master, only: %i[ show edit update destroy ]

  # GET /occupation_masters or /occupation_masters.json
  def index
    @occupation_masters = OccupationMaster.all
  end

  # GET /occupation_masters/1 or /occupation_masters/1.json
  def show
  end

  # GET /occupation_masters/new
  def new
    @occupation_master = OccupationMaster.new
  end

  # GET /occupation_masters/1/edit
  def edit
  end

  # POST /occupation_masters or /occupation_masters.json
  def create
    @occupation_master = OccupationMaster.new(occupation_master_params)

    respond_to do |format|
      if @occupation_master.save
        format.html { redirect_to master_admin_admin_managements_path(tab: "button-occupation"), notice: "Occupation master was successfully created." }
        format.json { render :show, status: :created, location: @occupation_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @occupation_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occupation_masters/1 or /occupation_masters/1.json
  def update
    respond_to do |format|
      if @occupation_master.update(occupation_master_params)
        format.html { redirect_to occupation_master_url(@occupation_master), notice: "Occupation master was successfully updated." }
        format.json { render :show, status: :ok, location: @occupation_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @occupation_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occupation_masters/1 or /occupation_masters/1.json
  def destroy
    @occupation_master.destroy

    respond_to do |format|
      format.html { redirect_to occupation_masters_url, notice: "Occupation master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occupation_master
      @occupation_master = OccupationMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def occupation_master_params
      params.require(:occupation_master).permit(:job_code, :job_title, :remarks, :master_name)
    end
end
