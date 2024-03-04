class AdminSearchFilter 
    def initialize(params)
        @params = params 
    end 

    # Searching And Filtering 
    def search_filter

        users = User.where(role: ["Administrator","Manager"]) 
        
        if @params[:user_number1].present? && @params[:user_number2].present? # Filter by Administrator Number

            first_number, second_number = SwapValue.new(@params[:user_number1],@params[:user_number2]).swap_values   
            users = users.where(id: (first_number)..(second_number))
        end 

        if @params[:user_name].present? # Search by Full Name 

            users = users.where("first_name like :s or last_name like :s or first_name || ' ' || last_name like :s", :s => "%#{@params[:user_name].titleize}%")

        end   

        if @params[:role].present? # Search by Authority

            users = users.where(role: @params[:role])
        end  
        
        if @params[:usage_classification].present? # Search by Usage Classification

            users = users.where(usage_classification: @params[:usage_classification])

        end  

        # Sorting 
        if @params[:direction].present? 
            users = users.order(created_at: @params[:direction].to_sym)
        else  
            users = users.order(created_at: :desc)
        end 

        users = users 

    end 

end 
