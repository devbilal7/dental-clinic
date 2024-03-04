class CounselingsController < ApplicationController
    layout "dashboard"

    # GET /counsel or /staff_infos.json
  def index  
    unless current_user.role == "Administrator" 
      clinic_id = current_user.clinic.id 
    end  
    @patients = SearchFilter.new(params,clinic_id).counseling_search.order(created_at: :desc)
    @q = @patients.ransack(params[:q])
    @pagy, @patients = pagy(@q.result)     
    # # Sorting 
    # if params[:direction].present? 
    #   @patients = @patients.order(created_at: params[:direction].to_sym)
    # else  
    #     @patients = @patients.order(created_at: :desc)
    # end 
      
    # # Pagination
    # if params[:pagy_default].present? 
    #     @pagy, @patients = pagy(@patients,items: params[:pagy_default].to_i)
    # else  
    #     @pagy, @patients = pagy(@patients)
    # end  
    @counseling_no = 0
    @errors = params[:errors].keys.zip(params[:errors].values).to_h if params[:errors].present?
  end

  def new 
    if params[:errors].present?
      @errors = eval(params[:errors]) 
    else  
      @errors = ""
    end 
    @counseling = Counseling.new(patient_id: params[:id])
    # @patient = Patient.find(params[:id])
    @counseling.oral_types.build
  
    respond_to do |format|
      format.js
    end
  end

  def create  
    @counseling = Counseling.new(counseling_params)
    if @counseling.save
      i = 1
      while(!params["site_name"+i.to_s].nil? && params["site_name"+i.to_s] != "")
        Site.create(counseling_id: @counseling.id, site_name: params["site_name"+i.to_s],site_offer_amount: params["site_offer_amount"+i.to_s],site_agreement: params["site_agreement"+i.to_s], site_consent_signing_date: params["site_consent_signing_date"+i.to_s],site_contract_amount: params["site_contract_amount"+i.to_s] )
        i += 1
      end
        redirect_to counselings_path, notice: "Counseling #{@counseling.resp_dr} Successfully Created!"
    else 
        @id = @counseling.patient.id 
        errors = @counseling.errors.attribute_names.zip(@counseling.errors.full_messages).to_h  
        redirect_to counselings_path(type: "createerrors",id: @id, errors: errors)
    end 
  end
  
  def edit 
    if params[:errors].present?
      @errors = eval(params[:errors]) 
    else  
      @errors = ""
    end
    @counseling = Counseling.includes(:oral_types).find(params[:id])
    @patient = Patient.find(params[:patient])
    @edit = params[:edit]

    @sites = Site.where(counseling_id: @counseling.id)
    respond_to do |format|
      format.js
    end
  end 

  def destroy 
    @counseling = Counseling.find(params[:id])
    @counseling.destroy 
    redirect_to counselings_path, notice: "Counseling #{@counseling.resp_dr} Successfully Deleted!"
  end 

  def aggregation_basic_information
      aggregation_period=params[:aggregation_period]
      @aggregation_basic_information=CounselingAggregation::AggregationBasicFilter.new(aggregation_period, "Counseling").aggregation_filter
      @datewise = @aggregation_basic_information.group_by {|t| t.created_at.beginning_of_day}
      if params[:aggregation_period].nil?
        @aggregation_period="All"
      else
        @aggregation_period=params[:aggregation_period]
      end
  end
  
  def individual_target
    @dentists=Dentist.all
    @dentist_hygienists=DentistHygienist.all
    @treatment_coordinators = TreatmentCoordinator.all
    @clinic_id = current_user.clinic.id
    @search_by = params["search_by"] 
    @index = 1
    params[:aggregation_period].present? ? @aggregation_period = params[:aggregation_period] : @aggregation_period = "All"
  end

  def consultant_list
    @dentists = Dentist.all 
    @dentist_hygienists = DentistHygienist.all
    @treatment_coordinators = TreatmentCoordinator.all
  end

  def batting_average
    @total_counselings1 =  Counseling.joins(:patient).where(patient: {clinic_id: current_user.clinic.id}).count 
    if params[:aggregation_period].present?
      @counselings = Counseling.joins(:patient).where("to_char(counselings.created_at, 'YYYY-mm') = ? AND patients.clinic_id = ?",params[:aggregation_period], current_user.clinic.id).group_by(&:dentist)
      @patients = Patient.where(clinic_id: current_user.clinic.id).joins(:counselings).where.not(counselings: {id: nil})
    else
      @counselings = Counseling.joins(:patient).where(patient: {clinic_id: current_user.clinic.id }).group_by(&:dentist)

      @patients = Patient.where(clinic_id: current_user.clinic.id).joins(:counselings).where.not(counselings: {id: nil})
      # @dentists = @patients.joins(:dentist).group_by(&:dentist)
      # @dentist_hygienists = @patients.joins(:dentist_hygienist).group_by(&:dentist_hygienist)
      # @treatment_coordinators = @patients.joins(:treatment_coordinator).group_by(&:treatment_coordinator)
    end

    @total_counselings = @patients.count
    patient_ids = @patients.pluck(:id)
    multiple_visit_id = MultipleVisitRoute.where(patient_id: patient_ids).group_by(&:patient_id).map{|s| s.last.last}.map{|t| t.id}
    @self_pay_contract = VisitRoute.where(id: multiple_visit_id).pluck(:self_pay_contract).count
    
  end

  def contract_list
    clinic_id = current_user.clinic.id
    patients = Patient.where(clinic_id: clinic_id)
    @patients = SearchFilter.new(params,clinic_id).filtering(patients).includes(:counselings)
  end
  
  def individual_consultant
    if params[:aggregation_period].present?    
      month = params[:aggregation_period].split("-").last.to_i
      year = params[:aggregation_period].split("-").first.to_i 
    else  
      month = Date.today.strftime("%m")
      year = Date.today.strftime("%Y")
    end 

    clinic_id = current_user.clinic.id
    @all_counselings = Counseling.where('extract(month from created_at) = ?', month).where('extract(year from created_at) = ?', year)
    if params[:dentist].present? 
      @all_counselings = @all_counselings.where(dentist_id: params[:dentist])
    end 
      @counselings = @all_counselings.group_by_day(&:created_at)
    

      respond_to do |format|
        format.html
        format.pdf do
          render  pdf: "", template: "counselings/individual_consultant", formats: [:html], layout: "pdf", orientation: "landscape"
        end
      end
  end

  def update 
    @counseling = Counseling.find(params[:id])
    if @counseling.update(counseling_params)
        i = 1
        Site.where(counseling_id: params[:id]).destroy_all
        while(!params["site_name"+i.to_s].nil? && params["site_name"+i.to_s] != "")
          Site.create(counseling_id: @counseling.id, site_name: params["site_name"+i.to_s],site_offer_amount: params["site_offer_amount"+i.to_s],site_agreement: params["site_agreement"+i.to_s], site_consent_signing_date: params["site_consent_signing_date"+i.to_s],site_contract_amount: params["site_contract_amount"+i.to_s] )
          i += 1
        end
        redirect_to counselings_path, notice: "Counseling #{@counseling.resp_dr} Successfully Updated!"
    else 
      @patientid = @counseling.patient.id 
      @id = @counseling.id 
      errors = @counseling.errors.attribute_names.zip(@counseling.errors.full_messages).to_h
      redirect_to counselings_path(type: "updateerrors",id: @id, errors: errors,patientid: @patientid)
    end 
  end 

  private 

    def counseling_params 
        params.require(:counseling).permit(:dentist_id, :resp_couns_staff,:emergency,
                                            :course_imp_date, :pcourse_imp_date, :first_visit,
                                            :re_first_visit, :second_visit, :p_consult, :inspection,
                                            :treat_plan, :prostho, :denture, :whitening, :implant,
                                            :invisalign, :other_correc, :micro, :maintainance,
                                            :main_resv_date, :main_trans, :type_agree, :prostho_type,
                                            :no_of_implant, :site, :offer_amt, :agreement,
                                            :cons_sign_date, :contract_amt, :patient_id, :course_id, :pcourse_id, oral_types_attributes: [:id, :name, :exp_date, :imp_date])
    end 

end
