module DentistAggregationsHelper

    def total(dentist_aggregations) 
        @total_no_of_reservations = dentist_aggregations.sum(:no_of_reservations)
        @total_actual_visit_patients = dentist_aggregations.sum(:actual_visit_patients)
        @total_insurance_peoples = dentist_aggregations.sum(:insurance_peoples)
        @total_emergency_patients = dentist_aggregations.sum(:emergency_patients)
        @total_new_patients = dentist_aggregations.sum(:new_patients)
        @total_re_entry_patients = dentist_aggregations.sum(:re_entry_patients)
        @total_patients_finished = dentist_aggregations.sum(:patients_finished)
        @total_no_of_cancellations = dentist_aggregations.sum(:no_of_cancellations)
        @total_no_notice_cancellations = dentist_aggregations.sum(:no_notice_cancellations)
        @total_score = dentist_aggregations.sum(:score)
        @total_own_expense_amount_money = dentist_aggregations.sum(:own_expense_amount_money)
        @total_miscellaneous_income = dentist_aggregations.sum(:miscellaneous_income)
        @total_own_expense_people = dentist_aggregations.sum(:own_expense_people)
        @total_no_of_people = dentist_aggregations.sum(:no_of_people)
        @total_referral_card = dentist_aggregations.sum(:referral_card)
        @total_referral_patients = dentist_aggregations.sum(:referral_patients)
        @total_people_returning_home = dentist_aggregations.sum(:people_returning_home)
        @total_payment_people = dentist_aggregations.sum(:payment_people)
        @total_through_no_of_reservations = dentist_aggregations.sum(:through_no_of_reservations)
        @total_through_rate = dentist_aggregations.sum(:through_rate)
        @total_actual_visit_peoples = dentist_aggregations.sum(:actual_visit_peoples)
        @total_introduction_card = dentist_aggregations.sum(:introduction_card)
        @total_introduction_patients = dentist_aggregations.sum(:introduction_patients)
        @total_referral_rate = dentist_aggregations.sum(:referral_rate)
        @total_cancellations = @total_no_of_cancellations + @total_no_notice_cancellations   

        @tel_rate = number_with_precision(@total_no_of_cancellations.to_f / @total_no_of_reservations.to_f,:precision => 2)
        @without_permission_rate = number_with_precision(@total_no_notice_cancellations.to_f / @total_no_of_reservations.to_f,:precision => 2)
        @total_rate = number_with_precision(@total_cancellations / @total_no_of_reservations.to_f,:precision => 2)
        @average_referral_rate = number_with_precision(@total_referral_rate.to_f / @total_actual_visit_patients,:precision => 2)
        @go_home_rate = number_with_precision(@total_people_returning_home / @total_no_of_reservations.to_f,:precision => 2)
    end 

    def monthly(dentist)
        @dentist_aggregations = dentist.dentist_aggregations.where(clinic_id: current_user.clinic.id).where('extract(year from created_at) = ?', @year).where('extract(month from created_at) = ?', @month) 
        if @dentist_aggregations.present? 
            @total_dentists += 1
        end 
    end 

    def yearly(annual_aggregations,month)
        @dentist_aggregations = annual_aggregations.where('extract(month from created_at) = ?', month)
    end 
    
    def yearly_individual(annual_aggregations,month,year)
        @dentist_aggregations = annual_aggregations.where('extract(year from created_at) = ?', year).where('extract(month from created_at) = ?', month)
        if @dentist_aggregations.present? 
            @total_months += 1
        end 
    end 

    def actual_visitors(dentist_aggregations)
        begin  
            dentist_aggregations.sum(:no_of_reservations) - (dentist_aggregations.sum(:no_of_cancellations) + dentist_aggregations.sum(:no_notice_cancellations)) - dentist_aggregations.sum(:people_returning_home)
        rescue 
            nil 
        end 
    end 

    def months 
        [['January',"01"], ['February',"02"], ['March',"03"],['April',"04"], ['May',"05"], ['June',"06"], ['July',"07"],['August',"08"], ['September',"09"], ['October',"10"],['November',"11"], ['December',"12"]]
    end 
    
end
