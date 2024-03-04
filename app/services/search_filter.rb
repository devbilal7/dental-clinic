class SearchFilter 
    def initialize(params,clinic_id)
        @params = params 
        @clinic_id = clinic_id 
    end 

    # Searching And Filtering 
    def search_filter
        if @clinic_id.present?
            patients = Patient.where(clinic_id: @clinic_id) 
        else  
            patients = Patient.all 
        end 

        if @params[:patient_number1].present? && @params[:patient_number2].present? # Filter by Patient Number

            first_number, second_number = SwapValue.new(@params[:patient_number1],@params[:patient_number2]).swap_values   
            patients = patients.where(patient_number: (first_number)..(second_number))
        end 

        if @params[:first_visit1].present? && @params[:first_visit2].present? # Filter by visits date

            first_date, second_date = SwapValue.new(@params[:first_visit1],@params[:first_visit2]).swap_values 
            patients = patients.joins(:multiple_visit_routes => :visit_route).where(visit_route:{first_visit: (first_date)..(second_date)})
        end 

        if @params[:next_reservation1].present? && @params[:next_reservation2].present? # Filter next reservation date 

            first_date, second_date = SwapValue.new(@params[:next_reservation1],@params[:next_reservation2]).swap_values 
            patients = patients.joins(:multiple_visit_routes => :visit_route).where(visit_route:{next_reservation_date: (first_date)..(second_date)})
        end 

        if @params[:last_visit1].present? && @params[:last_visit2].present? #Filter Last Visit Date 

            first_date, second_date = SwapValue.new(@params[:last_visit1],@params[:last_visit2]).swap_values 
            patients = patients.where(last_visit_date: (first_date)..(second_date))
        end 

        if @params[:patient_name].present? # Search by Name 

            patients = patients.where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{@params[:patient_name].titleize}%")
        end   

        if @params[:panorama].present? # Search by Panorama

            patients = patients.where(panorama: true)
        end  
        
        if @params[:caries_check].present? # Search by Caries_check

            patients = patients.where(caries_check: true)

        end  

        if @params[:course].present? # Search by Course

            patients = patients.where(course: @params[:course])

        end 
        
        if @params[:p_course].present? # Search by Course

            patients = patients.where(p_course: @params[:p_course])
        end 

        if @params[:unknown_course].present? # Search by Unknown Course

            patients = patients.where(unknown_course: @params[:unknown_course])
        end 

        if @params[:dr].present? # Search by Dentist

            patients = patients.where(dentist_id: @params[:dr])
        end 

        if @params[:dh].present? # Search by DentistHygienist

            patients = patients.where(dentist_hygienist_id: @params[:dh])
        end 


        if @params[:tc].present? # Search by TreatmentCoordinator

            patients = patients.where(treatment_coordinator_id: @params[:tc])
        end 
        

        patients = patients 

    end 

    def counseling_search 
        if @clinic_id.present?
            patients = Patient.includes(:counselings).where(clinic_id: @clinic_id)
        else  
            patients = Patient.includes(:counselings).all
        end 
        
        filtering(patients)
        
    end 

    def filtering(patients)
        if @params[:patient_number1].present? && @params[:patient_number2].present? # Filter by Patient Number

            first_number, second_number = SwapValue.new(@params[:patient_number1],@params[:patient_number2]).swap_values   
            patients = patients.where(patient_number: (first_number)..(second_number))
        end 
    
        if @params[:patient_name].present? # Search by Name 

            patients = patients.where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{@params[:patient_name].titleize}%")
        end 
        
        if @params[:aggregation_period1].present? && @params[:aggregation_period2].present? # Filter by Patient Number

            first_number, second_number = SwapValue.new(@params[:aggregation_period1],@params[:aggregation_period2]).swap_values   
            patients = patients.where(created_at: (first_number.to_date)..(second_number.to_date + 1))
        end 
        
        patients = patients 
    end 
end 
