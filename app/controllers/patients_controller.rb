class PatientsController < ApplicationController
  layout "dashboard"
  
  def index
    unless current_user.role == "Administrator" 
      clinic_id = current_user.clinic.id 
    end
    patients = SearchFilter.new(params,clinic_id).search_filter.includes(:dentist,:dentist_hygienist,:treatment_coordinator,multiple_visit_routes: [:visit_route])
    
    @q = patients.ransack(params[:q])
    @pagy, @patients = pagy(@q.result)
    unless params[:q].nil?
      m = MultipleVisitRoute.all.order(:created_at).group_by(&:patient_id).map{|s| s.last.last}.map{|t| t.id}
      p = patients.pluck(:id)
      if params[:q][:s] == "first_visit desc"        
        @pagy, @patients = pagy(patients.left_outer_joins(multiple_visit_routes: :visit_route).where(multiple_visit_routes: {id: m}).or(patients.where(id: p)).order("visit_route.first_visit DESC") )
      elsif params[:q][:s] == "first_visit asc" 
        @pagy, @patients = pagy(patients.left_outer_joins(multiple_visit_routes: :visit_route).where(multiple_visit_routes: {id: m}).or(patients.where(id: p)).order("visit_route.first_visit ASC") )
      elsif params[:q][:s] == "next_reservation_date desc"
        @pagy, @patients = pagy(patients.left_outer_joins(multiple_visit_routes: :visit_route).where(multiple_visit_routes: {id: m}).or(patients.where(id: p)).order("visit_route.next_reservation_date DESC") )
      elsif params[:q][:s] == "next_reservation_date asc" 
        @pagy, @patients = pagy(patients.left_outer_joins(multiple_visit_routes: :visit_route).where(multiple_visit_routes: {id: m}).or(patients.where(id: p)).order("visit_route.next_reservation_date ASC") )
      end
    end
    # Sorting 
    if params[:direction].present? 
      @patients = @patients.order(created_at: params[:direction].to_sym)
    else  
      @patients = @patients.order(created_at: :desc)
    end 

    # Pagination
    if params[:pagy_default].present? 
      @pagy, @patients = pagy(@patients,items: params[:pagy_default].to_i)
    else  
      @pagy, @patients = pagy(@patients)
    end 
    @patient_no = 0
  end

  def edit_patient
    @patient = Patient.find(params[:id]) unless params[:id].nil?
    respond_to do |format|
      format.js
    end
  end

  def show 
    @patient = Patient.find(params[:id])
    
  end 

  def new 
    @patient = Patient.new 
  end 

  def get_patient
    @patient = Patient.find_by_patient_number(params["patient_number"])
    respond_to do |format|
      format.js
    end
  end

  def create 
    if current_user.clinic.present?
      @patient = Patient.new(patient_params)
      @patient.first_name = params[:patient][:first_name].titleize
      @patient.last_name = params[:patient][:last_name].titleize 
      @patient.clinic_id = current_user.clinic.id 
      if @patient.save 
        if params[:patient][:patient_number].present? 
          @patient.patient_number = params[:patient][:patient_number]
          @patient.save 
        end 
        redirect_to patients_path, notice: "Patient #{@patient.first_name} Successfully Created!"
      else  
        render :new, status: :unprocessable_entity
      end 
    else
      redirect_to request.referer, alert: "First create your clinic."
    end
  end 

  # All Appointments List 
  def all_appointment 
    clinic_id = current_user.clinic.id 
    @patients = SearchFilter.new(params,clinic_id).search_filter.includes(multiple_visit_routes: [:visit_route]).order('created_at DESC')

    # Pagination
    @pagy,@patients = pagy(@patients)
    @patient_no = 0
  end 

  def create_appointment 
    patient = Patient.find_by(patient_number: params[:patient_number].to_i)
    if patient.present?  
        unless patient.multiple_visit_routes.present?
          redirect_to all_appointment_patients_path, alert: t("patient.Create Visit Route First!")
        else  
          next_reservation = patient.multiple_visit_routes.last.amoeba_dup
          next_reservation.visit_route.next_reservation_date = params[:next_reservation]
          redirect_to all_appointment_patients_path, notice: t("patient.New Appointment!") if next_reservation.save 
        end 
    else 
        redirect_to all_appointment_patients_path, alert: t("patient.Patient Number Is Not Available!")
    end 
  end 

  # Last Visits List
  def last_visit 
    clinic_id = current_user.clinic.id 
    @patients = SearchFilter.new(params,clinic_id).search_filter.order('updated_at DESC') 
    @pagy, @patients = pagy(@patients) # Pagination
    @patient_no = 0
  end 

  def create_last_visit 
    patient = Patient.find_by(patient_number: params[:patient_number].to_i)
    if patient.present? && params[:last_visit].present? && params[:last_visit].to_date <= Date.today  
        patient.update(last_visit_date: params[:last_visit])  
        redirect_to last_visit_patients_path, notice: t("patient.Last Visit Date Updated!")
    else  
        redirect_to last_visit_patients_path, alert: t("patient.Patient Number Is Not Available!")
    end 
  end 


  # Appointment Jquery
  def appointment 
    @patient = Patient.find(params[:id])
  end 
  
  def add_appointment 
    @patient = Patient.find(params[:id])
       
    if params[:patient][:appointment_date] <= DateTime.now 
      redirect_to patient_path(@patient), notice: "Can't select older dates!" 
    else 
      @patient.appointment.push params[:patient][:appointment_date] 
      @patient.save  
      redirect_to patient_path(@patient), notice: "New Appointment Added!"
    end 
  end 

  def edit 
    @patient = Patient.find(params[:id])
  end 

  def update 
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params) 
      redirect_to patients_path, notice: "Patient #{@patient.first_name} Successfully Updated!"
    else  
      render :edit, status: :unprocessable_entity
    end 
  end 

  def update_patient
    @patient = Patient.find(params[:patient][:patient_number])
    if @patient.update(patient_params) 
      redirect_to patients_path, notice: "Patient #{@patient.first_name} Successfully Updated!"
    else  
      render :edit, status: :unprocessable_entity
    end 
  end 

  def destroy 
    @patient = Patient.find(params[:id])
    @patient.destroy 

    redirect_to patients_path, notice: "Patient #{@patient.first_name} Successfully Deleted!"
  end 

  private 

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
  def appointment_params 
    params.require(:appointment).permit(:patient_number,:appointment_date)
  end 

  def patient_params 
    params.require(:patient).permit(:first_name, :last_name, :patient_number, :patient_visit_route, :keyword, :panorama, :caries_check, :course, :p_course, :note, :dentist_id, :dentist_hygienist_id, :treatment_coordinator_id, :keyword_detail, :unknown_course)
  end 

  # def appointment_params 
  #   params.require(:patient).permit(:appointment_date)
  # end 
end
