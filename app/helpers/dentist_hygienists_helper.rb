module DentistHygienistsHelper

    def dh_monthly(dh, index)
         if @dh_aggregations[index-1].created_at.strftime("%Y-%m-%d") != dh.created_at.strftime("%Y-%m-%d") || index == 0 
             @no_of_reservations = dh.no_of_reservations.to_i
        else
             @no_of_reservations += dh.no_of_reservations.to_i 
        end 
        if @dh_aggregations[index+1].nil? 
             @i="final_data" 
        elsif @dh_aggregations[index+1].created_at.strftime("%Y-%m-%d") == dh.created_at.strftime("%Y-%m-%d") 
               @i="not_final_data" 
        else 
            @i="final_data" 
        end 
    end
    
end
