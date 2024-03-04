class PcoursesController < ApplicationController
  layout "dashboard"
  before_action :set_pcourse, only: %i[ show edit update destroy ]

  # GET /pcourses or /pcourses.json
  def index
    @pcourses = Pcourse.all
  end

  # GET /pcourses/1 or /pcourses/1.json
  def show
  end

  # GET /pcourses/new
  def new
    @pcourse = Pcourse.new
  end

  # GET /pcourses/1/edit
  def edit
  end

  # POST /pcourses or /pcourses.json
  def create
    @pcourse = Pcourse.new(pcourse_params)

    respond_to do |format|
      if @pcourse.save
        format.html { redirect_to master_admin_admin_managements_path(tab: "button-pcourse"), notice: "Pcourse was successfully created." }
        format.json { render :show, status: :created, location: @pcourse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pcourse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pcourses/1 or /pcourses/1.json
  def update
    respond_to do |format|
      if @pcourse.update(pcourse_params)
        format.html { redirect_to pcourse_url(@pcourse), notice: "Pcourse was successfully updated." }
        format.json { render :show, status: :ok, location: @pcourse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pcourse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pcourses/1 or /pcourses/1.json
  def destroy
    @pcourse.destroy

    respond_to do |format|
      format.html { redirect_to pcourses_url, notice: "Pcourse was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pcourse
      @pcourse = Pcourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pcourse_params
      params.require(:pcourse).permit(:name, :code, :remarks, :master_name)
    end
end
