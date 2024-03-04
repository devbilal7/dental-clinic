class SearchFilterStaff 
    def initialize(params,clinic_id)
        @params = params 
        @clinic_id = clinic_id
    end 

    # Searching And Filtering 
    def search_filter
        if @clinic_id.present?
            staff_infos = StaffInfo.where(clinic_id: @clinic_id) 
        else  
            staff_infos = StaffInfo.all 
        end 

        if @params[:staff_code1].present? && @params[:staff_code2].present? # Filter by Patient Number
            first_number, second_number = SwapValue.new(@params[:staff_code1],@params[:staff_code2]).swap_values   
            staff_infos = staff_infos.where( staff_code: (first_number)..(second_number))
        end 

        if @params[:first_name].present? # Search by Name 
            staff_infos = staff_infos.where("LOWER(first_name) like :s or LOWER(last_name) like :s or LOWER(first_name) || ' ' || LOWER(last_name) like :s", :s => "%#{@params[:first_name].downcase}%")
        end 

        if @params[:job_type].present?  # Search by Job Type
            staff_infos = staff_infos.where(job_type: @params[:job_type].downcase)
        end

        if @params[:occupation].present? # Search by Occupation
            staff_infos = staff_infos.where("LOWER(occupation) like :s", :s => "%#{@params[:occupation].downcase}%")
        end

        if @params[:usage_classification].present? # Search by Usage Classification
            staff_infos = staff_infos.where("LOWER(usage_classification) like :s", :s => "%#{@params[:usage_classification].downcase}%")
        end

        if @params[:sex].present? #  Search by Sex
            staff_infos = staff_infos.where(sex: @params[:sex].downcase)

        end   
        
        staff_infos = staff_infos
        
    end 
end 
