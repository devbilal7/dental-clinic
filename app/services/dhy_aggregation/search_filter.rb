module DhyAggregation
    class SearchFilter 
        def initialize(params,clinic_id)
            @params = params 
            @clinic_id = clinic_id
        end 

        def search_filter 
            unless @params[:first_date].present? && @params[:second_date].present?
                @year = Date.today.strftime("%Y")
                @hash = {@year => [1,2,3,4,5,6,7,8,9,10,11,12]}
                @dh_aggregations = DhAggregation.where(clinic_id: @clinic_id).where('extract(year from created_at) = ?', @year)
            else      
                first_month = @params[:first_date].split("-").last.to_i
                first_year = @params[:first_date].split("-").first.to_i 
                first_date = Date.new(first_year) + (first_month-1).month
    
                second_month = @params[:second_date].split("-").last.to_i
                second_year = @params[:second_date].split("-").first.to_i 
                second_date = Date.new(second_year) + (second_month-1).month 
                
                @first_date, @second_date = SwapValue.new(first_date,second_date).swap_values
                if @params[:responsible_person].present?   
                    @dh_aggregations = DhAggregation.where(clinic_id: @clinic_id,dentist_hygienist_id: @params[:responsible_person]).where(created_at: (@first_date)..(@second_date + 1))
                else
                    @dh_aggregations = DhAggregation.where(clinic_id: @clinic_id).where(created_at: (@first_date)..(@second_date + 1))
                end
                
                years = (@first_date.strftime("%Y")..@second_date.strftime("%Y")).to_a 
                @hash = {}
                years.each do |e| 
                    if e == years.first  
                        @hash[e] = (@first_date.strftime("%m").to_i..12).to_a
                    elsif e == years.last  
                        @hash[e] = (1..@second_date.strftime("%m").to_i).to_a
                    else   
                        @hash[e] = (1..12).to_a
                    end  
                end  
                #  abort()
            end 
            return @hash, @dh_aggregations
        end 

        def index_search 
            if @params[:month].present? && @params[:year].present? && @params[:responsible_person].present?
                year = @params[:year]
                month = @params[:month]
                dh_aggregations = DhAggregation.where(clinic_id: @clinic_id,dentist_hygienist_id: @params[:responsible_person]).where('extract(year from created_at) = ?', @params[:year]).where('extract(month from created_at) = ?', @params[:month])
            else  
                year = Date.today.strftime("%Y")
                month = Date.today.strftime("%m")
                dh_aggregations = DhAggregation.where(clinic_id: @clinic_id).where('extract(year from created_at) = ?', year).where('extract(month from created_at) = ?', month)
            end 
            return dh_aggregations, year, month
        end 

        def individual_graph
            unless @params[:first_date].present? && @params[:second_date].present? 
                @year = Date.today.strftime("%Y")
                dh_aggregations = DhAggregation.where(clinic_id: @clinic_id).where('extract(year from created_at) = ?', @year)
            else  
                first_month = @params[:first_date].split("-").last.to_i
                first_year = @params[:first_date].split("-").first.to_i 
                first_date = Date.new(first_year) + (first_month-1).month
                
                second_month = @params[:second_date].split("-").last.to_i
                second_year = @params[:second_date].split("-").first.to_i 
                second_date = Date.new(second_year) + (second_month-1).month 
                
                @first_date, @second_date = SwapValue.new(first_date,second_date).swap_values
                dh_aggregations = DhAggregation.where(clinic_id: @clinic_id,dentist_hygienist_id: @params[:responsible_person]).where(created_at: (@first_date)..(@second_date + 1))
            end 
            return dh_aggregations
        end 
    end 
end 