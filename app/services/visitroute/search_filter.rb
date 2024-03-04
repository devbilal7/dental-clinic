module Visitroute
    class SearchFilter 
        def initialize(params,clinic_id)
            @params = params 
            @clinic_id = clinic_id 
        end 

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

            if @params[:second_reservation1].present? && @params[:second_reservation2].present? # Filter Second date 
                
                first_date, second_date = SwapValue.new(@params[:second_reservation1],@params[:second_reservation2]).swap_values 
                patients = patients.joins(:multiple_visit_routes => :visit_route).where(visit_route:{second: (first_date)..(second_date)})
            end

            if @params[:treatment1].present? && @params[:treatment2].present? # Filter Treatment Plan 
                
                first_date, second_date = SwapValue.new(@params[:treatment1],@params[:treatment2]).swap_values 
                patients = patients.joins(:multiple_visit_routes => :visit_route).where(visit_route:{treatment_plan_date: (first_date)..(second_date)})
            end

            if @params[:visit_route].present? # Search by visit_route
                
                patients = patients.where("patient_visit_route like?", "%#{@params[:visit_route]}%")
            end

            if @params[:dr].present? # Search by Dentist
                
                patients = patients.joins(:dentist).where(dentist: {first_name: @params[:dr]})
            end
                
            if @params[:dh].present? # Search by Dentist Hyginest
                
                patients = patients.joins(:dentist_hygienist).where(dentist_hygienist: {first_name: @params[:dh]})   
                # binding.pry
            end
                
            if @params[:tc].present? # Search by Dentist Hyginest
                
                patients = patients.joins(:treatment_coordinator).where(treatment_coordinator: {first_name: @params[:tc]})
                
            end

            if @params[:patient_name].present? # Search by Name 
                
                patients = patients.where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{@params[:patient_name].titleize}%")
        
            end 
            # binding.pry
            patients = patients
        end 

        def jop_type 
            @hash = {}
             Dentist.all.map{|m| @hash[m.full_name] = m.full_name}
             DentistHygienist.all.map{|m| @hash[m.full_name] = m.full_name}
             TreatmentCoordinator.all.map{|m| @hash[m.full_name] = m.full_name}
            # StaffInfo.all.map{|m| @hash [m.full_name] = m.full_name}
            @hash 
        end 

        def new_patient_search(visits)
            unless @params[:first_date].present? && @params[:second_date].present?
                @year = Date.today.strftime("%Y")
                month = Date.today.strftime("%m")
                @hash = {@year => (1..(month.to_i)).to_a}
                average_months = @hash.values.flatten.count
                visits = visits.where('extract(year from created_at) = ?', @year) 
            else      
                ## By Date 
                first_month = @params[:first_date].split("-").last.to_i
                first_year = @params[:first_date].split("-").first.to_i 
                first_date = Date.new(first_year) + (first_month-1).month
    
                second_month = @params[:second_date].split("-").last.to_i
                second_year = @params[:second_date].split("-").first.to_i 
                second_date = Date.new(second_year) + (second_month-1).month 
                
                @first_date, @second_date = SwapValue.new(first_date,second_date).swap_values
            
                years = (@first_date.strftime("%Y")..@second_date.strftime("%Y")).to_a 
                @hash = {}
                years.each do |e| 
                    if e == years.first && e == years.last 
                        @hash[e] = (@first_date.strftime("%m").to_i..@second_date.strftime("%m").to_i).to_a
                    elsif e == years.first  
                        @hash[e] = (@first_date.strftime("%m").to_i..12).to_a
                    elsif e == years.last  
                        @hash[e] = (1..@second_date.strftime("%m").to_i).to_a
                    else   
                        @hash[e] = (1..12).to_a
                    end  
                end  
                average_months = @hash.values.flatten.count 
                visits = visits.where(created_at: (@first_date)..(@second_date + 1.month))
            end 

            # By Occupation and Manager
            if @params[:occupation].present? && @params[:manager].present? 
                visits = visits.where(charge_job_type: @params[:occupation],person_in_charge: @params[:manager])
            end 

            return @hash, average_months, visits
        end 
    end 
end 