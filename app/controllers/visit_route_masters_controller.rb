class VisitRouteMastersController < ApplicationController
  layout "dashboard"
  before_action :set_visit_route_master, only: %i[ show edit update destroy ]

  # GET /visit_route_masters or /visit_route_masters.json
  def index
    @visit_route_masters = VisitRouteMaster.all
  end

  # GET /visit_route_masters/1 or /visit_route_masters/1.json
  def show
  end

  # GET /visit_route_masters/new
  def new
    @visit_route_master = VisitRouteMaster.new
  end

  # GET /visit_route_masters/1/edit
  def edit
  end

  # POST /visit_route_masters or /visit_route_masters.json
  def create
    @visit_route_master = VisitRouteMaster.new(visit_route_master_params)

    respond_to do |format|
      if @visit_route_master.save
        format.html { redirect_to master_admin_admin_managements_path(tab: "button-visit_routes"), notice: "Visit route master was successfully created." }
        format.json { render :show, status: :created, location: @visit_route_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visit_route_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visit_route_masters/1 or /visit_route_masters/1.json
  def update
    respond_to do |format|
      if @visit_route_master.update(visit_route_master_params)
        format.html { redirect_to visit_route_master_url(@visit_route_master), notice: "Visit route master was successfully updated." }
        format.json { render :show, status: :ok, location: @visit_route_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visit_route_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visit_route_masters/1 or /visit_route_masters/1.json
  def destroy
    @visit_route_master.destroy

    respond_to do |format|
      format.html { redirect_to visit_route_masters_url, notice: "Visit route master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit_route_master
      @visit_route_master = VisitRouteMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visit_route_master_params
      params.require(:visit_route_master).permit(:visit_route_code, :visit_route_name, :remarks, :master_name)
    end
end
