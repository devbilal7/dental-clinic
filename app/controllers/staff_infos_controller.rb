class StaffInfosController < ApplicationController
  layout "dashboard"
  before_action :set_staff_info, only: %i[ show edit update destroy ]

  # GET /staff_infos or /staff_infos.json
  def index
    unless current_user.role == "Administrator" 
      clinic_id = current_user.clinic.id 
    end 
    @staff_infos = SearchFilterStaff.new(params,clinic_id).search_filter
    
    # Sorting 
    if params[:direction].present? 
      @staff_infos = @staff_infos.order(created_at: params[:direction].to_sym)
    else  
      @staff_infos = @staff_infos.order(created_at: :desc)
    end 

    # Pagination
    if params[:pagy_default].present? 
      @pagy, @staff_infos = pagy(@staff_infos,items: params[:pagy_default].to_i)
    else  
      @pagy, @staff_infos = pagy(@staff_infos)
    end 
    
    @staff_info_no = 0

  end

  # GET /staff_infos/1 or /staff_infos/1.json
  def show
  end

  # GET /staff_infos/new
  def new
    @staff_info = StaffInfo.new
  end

  # GET /staff_infos/1/edit
  def edit
    @staff_info = StaffInfo.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /staff_infos or /staff_infos.json
  def create
    if params[:staff_info][:job_type] == "Dentist" || params[:staff_info][:job_type] == "DentistHygienist" || params[:staff_info][:job_type] == "TreatmentCoordinator"
      params[:staff_info][:type]=params[:staff_info][:job_type]
    else
      params[:staff_info][:type] = ""
    end
    @staff_info = StaffInfo.new(staff_info_params)
    @staff_info.clinic_id = current_user.clinic.id 
    if @staff_info.save 
      redirect_to staff_infos_path, notice: "Staff Info  #{@staff_info.first_name} Successfully Created!"
    else  
      render :new, status: :unprocessable_entity
    end 
  end

  # PATCH/PUT /staff_infos/1 or /staff_infos/1.json
  def update
    @staff_info.type = params[:type].nil? ? params[:staff_info][:job_type] : params[@staff_info.class.name.underscore][:job_type]
    unless @staff_info.type  == "Dentist" || @staff_info.type  == "DentistHygienist" || @staff_info.type  == "TreatmentCoordinator"
      @staff_info.type = ""
    end
    respond_to do |format|
      if @staff_info.update(staff_info_params)
        format.html { redirect_to staff_infos_path, notice: "Staff info was successfully updated." }
        format.json { render :show, status: :ok, location: @staff_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_infos/1 or /staff_infos/1.json
  def destroy
    @staff_info = StaffInfo.find(params[:id])
    @staff_info.destroy 

    redirect_to staff_infos_path, notice: "Staff Information #{@staff_info.first_name} was successfully Deleted!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_info
      @staff_info = StaffInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_info_params
     return params.require(:staff_info).permit(:staff_code, :first_name, :last_name, :first_name_kana, :last_name_kana, :sex, :type, :job_type, :occupation, :usage_classification, :hire_date, :date_of_leaving_company, :clinic_id) if params.has_key? :staff_info
     return params.require(:dentist).permit(:staff_code, :first_name, :last_name, :first_name_kana, :last_name_kana, :sex, :type, :occupation, :job_type, :usage_classification, :hire_date, :date_of_leaving_company, :clinic_id) if params.has_key? :dentist
     return params.require(:dentist_hygienist).permit(:staff_code, :first_name, :last_name, :first_name_kana, :last_name_kana, :sex, :type, :occupation, :job_type, :usage_classification, :hire_date, :date_of_leaving_company, :clinic_id) if params.has_key? :dentist_hygienist
     return params.require(:treatment_coordinator).permit(:staff_code, :first_name, :last_name, :first_name_kana, :last_name_kana, :sex, :type, :occupation, :job_type, :usage_classification, :hire_date, :date_of_leaving_company, :clinic_id) if params.has_key? :treatment_coordinator
    end
end