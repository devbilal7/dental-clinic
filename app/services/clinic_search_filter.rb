class ClinicSearchFilter 
    def initialize(params)
        @params = params 
    end 

    # Searching And Filtering 
    def search_filter

        users = User.where(role: "ClinicUser") 
        
        if @params[:user_number1].present? && @params[:user_number2].present? # Filter by User Number

            first_number, second_number = SwapValue.new(@params[:user_number1],@params[:user_number2]).swap_values   
            users = users.where(id: (first_number)..(second_number))
        end 

        if @params[:user_name].present? # Search by Name 

            users = users.joins(:clinic).where(clinic: {name: @params[:user_name]})
        end   

        if @params[:region].present? # Search by Region

            users = users.joins(:clinic).where(clinic: {region: @params[:region]})
        end  
        
        if @params[:usage_classification].present? # Search by Usage Classification

            users = users.where(usage_classification: @params[:usage_classification])

        end  

        if @params[:postal_code].present? # Search by Postal Code

            users = users.joins(:clinic).where(clinic: {postal_code: @params[:postal_code]})
        end  

        if @params[:municipalities].present? # Search by Municipalities

            users = users.joins(:clinic).where(clinic: {municipalities: @params[:municipalities]})
        end  

        if @params[:address].present? # Search by Address

            users = users.joins(:clinic).where(clinic: {address: @params[:address]})
        end  

        if @params[:building_name].present? # Search by Building Name

            users = users.joins(:clinic).where(clinic: {building_name: @params[:building_name]})
        end  

        if @params[:phone_number].present? # Search by phone number

            users = users.joins(:clinic).where(clinic: {phone_number: @params[:phone_number]})
        end  

        if @params[:fax_number].present? # Search by Fax Number

            users = users.joins(:clinic).where(clinic: {fax_number: @params[:fax_number]})
        end  

        if @params[:representative_name].present? # Search by Representative Name 
            users = users.joins(:clinic).where("clinics.representative_first_name like :s or clinics.representative_last_name like :s or clinics.representative_first_name || ' ' || clinics.representative_last_name like :s", :s => "%#{@params[:representative_name].titleize}%")
        end  

        if @params[:person_incharge1].present? # Search by Person In Charge1  Name 
            users = users.joins(:clinic).where("clinics.charge1_first_name like :s or clinics.charge1_last_name like :s or clinics.charge1_first_name || ' ' || clinics.charge1_last_name like :s", :s => "%#{@params[:person_incharge1].titleize}%")
        end  

        if @params[:person_incharge2].present? # Search by Person In Charge2 Name 
            users = users.joins(:clinic).where("clinics.charge2_first_name like :s or clinics.charge2_last_name like :s or clinics.charge2_first_name || ' ' || clinics.charge2_last_name like :s", :s => "%#{@params[:person_incharge1].titleize}%")
        end  

        # .where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{@params[:patient_name].titleize}%")
        # .where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{@params[:patient_name].titleize}%")
        # .where("keywords.name LIKE ?", "%#{search}%")
        users = users 

    end 

end 
