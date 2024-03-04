module CounselingAggregation
    class AggregationBasicFilter 
        def initialize(aggregation_filter,table_name)
            @aggregation_period = aggregation_filter
            @table_name = table_name
        end
    
        def aggregation_filter
            if @aggregation_period == "6Months"
                @aggregation_information=@table_name.constantize.where(created_at: 6.months.ago..Time.now)
            
            elsif @aggregation_period == "1Year"
                @aggregation_information=@table_name.constantize.where(created_at: 1.year.ago..Time.now)
            
            elsif @aggregation_period == "7Days"
                @aggregation_information=@table_name.constantize.where(created_at: 7.days.ago..Time.now)
            
            elsif @aggregation_period == "15Days"
                @aggregation_information=@table_name.constantize.where(created_at: 15.days.ago..Time.now)
            
            elsif @aggregation_period == "30Days"
                @aggregation_information=@table_name.constantize.where(created_at: 30.days.ago..Time.now)
            
            elsif @aggregation_period == "Today"
                @aggregation_information=@table_name.constantize.where("created_at::date = ? ",Date.today.strftime("%Y-%m-%d"))                    
            else
                @aggregation_period = "All"
                @aggregation_information=@table_name.constantize.all
            end
        end 
    end 
end 