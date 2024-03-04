class VisitRoutesController < ApplicationController
    layout "dashboard"
    def index 
        unless current_user.role == "Administrator" 
            clinic_id = current_user.clinic.id 
        end 
        @patients = Visitroute::SearchFilter.new(params,clinic_id).search_filter.includes(:dentist,:dentist_hygienist,:treatment_coordinator,multiple_visit_routes: [:visit_route])
        
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

        respond_to do |format|
            format.html
            format.pdf do
              render  pdf: "Patient Details#{@patients.count}", template: "visit_routes/_index", formats: [:html], layout: "pdf", orientation: "landscape"
            end
          end
    end 
    
    def new 
        @multi_visit_route = MultipleVisitRoute.new(patient_id: params[:id])
        @multi_visit_route.build_visit_route 
        @patient = Patient.find(params[:id])
        @hash = Visitroute::SearchFilter.new(params,current_user.clinic.id).jop_type
        
        respond_to do |format|
            format.js
        end
    end 

    def create 
        @multi_visit_route = MultipleVisitRoute.new(multiple_visit_params)
        @patient = Patient.find(params[:multiple_visit_route][:patient_id])
        @patient.last_visit_date = params[:multiple_visit_route][:visit_route_attributes][:first_visit]
        if @multi_visit_route.save
            @patient.save 
            redirect_to visit_routes_path,notice: "Visit Route Created Successfully!"
        else 
            @patient = Patient.find(params[:visit_route][:patient_id])
            render :new 
        end 
    end 

    def edit 
        @multi_visit_route = MultipleVisitRoute.find(params[:id])
        @patient = Patient.find(params[:patient])
        @hash = Visitroute::SearchFilter.new(params,current_user.clinic.id).jop_type

        respond_to do |format|
            format.js
        end
    end 

    def update 
        @visit_route = MultipleVisitRoute.find(params[:id])
        if @visit_route.update(multiple_visit_params)
            redirect_to visit_routes_path, notice: "Visit Route Successfully Updated!"
        else  
            @patient=Patient.find(params[:visit_route][:patient_id])
            render :edit, status: :unprocessable_entity
        end 
    end     

    def monthly_tabulation
        @dentists=Dentist.all.includes(patients: [:counselings])
        @dentist_hygienists=DentistHygienist.all.includes(:patients)
        @treatment_coordinators = TreatmentCoordinator.all.includes(:patients)
        @clinic_id = current_user.clinic.id
        @search_by = params["search_by"] 
        @index = 1

        respond_to do |format|
            format.html
            format.pdf do
                if params[:tab] == "course"
                 render  pdf: "", template: "visit_routes/_monthly_course", formats: [:html], layout: "pdf", orientation: "landscape"
                elsif params[:tab] == "p_course"
                    render  pdf: "", template: "visit_routes/_monthly_pcourse", formats: [:html], layout: "pdf", orientation: "landscape"
                else
                    render  pdf: "", template: "visit_routes/_monthly_summary", formats: [:html], layout: "pdf", orientation: "landscape"
                end 
            end
          end
    end


    def new_patient_progress
        
        # Patient Progress
        multiple_visit_route = MultipleVisitRoute.joins(:patient).where(patient: {clinic_id: current_user.clinic.id})
        @multiple_visits = multiple_visit_route.all.order(:created_at).group_by(&:patient_id).map{|s| s.last.last}.map{|t| t.id}
        m = @multiple_visits.join(',')
        if @multiple_visits.present? 
            @visit_routes = VisitRoute.where("multiple_visit_route_id IN (#{m})")
        else  
            @visit_routes = VisitRoute.where("multiple_visit_route_id IN (0)")
        end 
        @hash, @average_months, @visits = Visitroute::SearchFilter.new(params,current_user.clinic.id).new_patient_search(@visit_routes)
        
        # Course And PCourse
        patient_ids = MultipleVisitRoute.where(id: @multiple_visits).pluck(:patient_id)
        @courses = Patient.where(clinic_id: current_user.clinic.id).where(id: patient_ids)

        unless params[:first_date].present? && params[:second_date].present? 
            @year = Date.today.strftime("%Y")
            @courses = @courses.where('extract(year from created_at) = ?', @year)
        end 

        # @average_months return the total number of months 


        respond_to do |format|
            format.html
            format.pdf do
              render  pdf: "", template: "visit_routes/new_patient_progress", formats: [:html], layout: "pdf", orientation: "landscape"
            end
          end
    end

    def new_patient_indi_progress
        
        @manager = Visitroute::SearchFilter.new(params,current_user.clinic.id).jop_type
        # Patient Progress
        multiple_visit_route = MultipleVisitRoute.joins(:patient).where(patient: {clinic_id: current_user.clinic.id})
        @multiple_visits = multiple_visit_route.all.order(:created_at).group_by(&:patient_id).map{|s| s.last.last}.map{|t| t.id}
        m = @multiple_visits.join(',')
        if @multiple_visits.present? 
            @visit_routes = VisitRoute.where("multiple_visit_route_id IN (#{m})")
        else  
            @visit_routes = VisitRoute.where("multiple_visit_route_id IN (0)")
        end 
        @hash, @average_months, @visits = Visitroute::SearchFilter.new(params,current_user.clinic.id).new_patient_search(@visit_routes)
        
        # Course And PCourse
        if params[:occupation].present? && params[:manager].present? 
            @multiple_visits = VisitRoute.where(id: @multiple_visits).where(charge_job_type: params[:occupation],person_in_charge: params[:manager]).pluck(:id)    
        end 
        patient_ids = MultipleVisitRoute.where(id: @multiple_visits).pluck(:patient_id)        
        @courses = Patient.where(clinic_id: current_user.clinic.id).where(id: patient_ids)

        unless params[:first_date].present? && params[:second_date].present? 
            @year = Date.today.strftime("%Y")
            @courses = @courses.where('extract(year from created_at) = ?', @year)
        end 
        
        # @average_months return the total number of months 


        respond_to do |format|
            format.html
            format.pdf do
              render  pdf: "", template: "visit_routes/new_patient_indi_progress", formats: [:html], layout: "pdf", orientation: "landscape"
            end
          end
    end

    private 

    def multiple_visit_params 
        params.require(:multiple_visit_route).permit(:patient_id, visit_route_attributes: [:first_visit, :second, :treatment_plan_date, :implant_correction, :self_pay_contract,:maintenance, :treatment_plan, :treatment_plan_date, :suspension, :suspended_date, :confirmation_end, :end_date, :maintenance_visit, :maintenance_visit_date, :contact_TEL, :suspension_contact_TEL, :suspended_contact_postcard, :contact_postcard, :patient_id, :visit_after_interruption, :p_heavy_defense_target, :p_heavy_defense_calculation_date, :inspection_4mm, :p_second,:inspection_3, :fop, :whitening, :medical_tube, :mt_tooth_number, :malocclusion, :note, :prosthodontics, :next_reservation_date, :thank_you_note, :thank_you_note_patient_no, :introducer_name, :person_in_charge, :charge_job_type,:p_heavy_defense_calculation])
    end 
end
