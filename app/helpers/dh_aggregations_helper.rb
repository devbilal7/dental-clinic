module DhAggregationsHelper
    def dh_index(dh, index)
        if @dh_aggregations[index-1].created_at.strftime("%Y-%m-%d") != dh.created_at.strftime("%Y-%m-%d") || index == 0
            @no_of_reservations   = dh.no_of_reservations.to_i
            @people_maintenance   = dh.people_maintenance.to_i
            @people_treatment     = dh.people_treatment.to_i
            @people_own_expense   = dh.people_own_expense.to_i
            @oral_count           = dh.oral_count.to_i
            @out_of_the_decline   = dh.out_of_the_decline.to_i
            @cancellation_tel     = dh.cancellation_tel.to_i
            @cancellation_without = dh.cancellation_without.to_i
            @insurance_maintenance= dh.insurance_maintenance.to_i
            @insurance_treatment  = dh.insurance_treatment.to_i
            @own_income           = dh.own_income.to_i
            @miscc_income         = dh.miscc_income.to_i
            @no_of_people         = dh.no_of_people.to_i
            @appt_confm_people    = dh.appt_confm_people.to_i
            @interval_1m_people   = dh.interval_1m_people.to_i
            @interval_1m_tel      = dh.interval_1m_tel.to_i
            @interval_1m_without  = dh.interval_1m_without.to_i
            @interval_2m_people   = dh.interval_2m_people.to_i
            @interval_2m_tel      = dh.interval_2m_tel.to_i
            @interval_2m_without  = dh.interval_2m_without.to_i
            @interval_3m_people   = dh.interval_3m_people.to_i
            @interval_3m_tel      = dh.interval_3m_tel.to_i
            @interval_3m_without  = dh.interval_3m_without.to_i
            @interval_4m_people   = dh.interval_4m_people.to_i
            @interval_4m_tel      = dh.interval_4m_tel.to_i
            @interval_4m_without  = dh.interval_4m_without.to_i
            @interval_6m_people   = dh.interval_6m_people.to_i
            @interval_6m_tel      = dh.interval_6m_tel.to_i
            @interval_6m_without  = dh.interval_6m_without.to_i
            @spt2                 = dh.spt2.to_i
            @spt1                 = dh.spt1.to_i
            @g_p_heavy_defense    = dh.g_p_heavy_defense.to_i
            @no_of_referrals      = dh.no_of_referrals.to_i
            @oral_func            = dh.oral_func.to_i
            @med_prac_rev         = dh.med_prac_rev.to_i
            @act_med_exam_days    = dh.act_med_exam_days.to_i
            @one_day_no_reservation = dh.one_day_no_reservation.to_i
       else
            @no_of_reservations   += dh.no_of_reservations.to_i
            @people_maintenance   += dh.people_maintenance.to_i 
            @people_treatment     += dh.people_treatment.to_i
            @people_own_expense   += dh.people_own_expense.to_i
            @oral_count           += dh.oral_count.to_i  
            @out_of_the_decline   += dh.out_of_the_decline.to_i
            @cancellation_tel     += dh.cancellation_tel.to_i
            @cancellation_without += dh.cancellation_without.to_i
            @insurance_maintenance+= dh.insurance_maintenance.to_i
            @insurance_treatment  += dh.insurance_treatment.to_i
            @own_income           += dh.own_income.to_i
            @miscc_income         += dh.miscc_income.to_i
            @no_of_people         += dh.no_of_people.to_i 
            @appt_confm_people    += dh.appt_confm_people.to_i
            @interval_1m_people   += dh.interval_1m_people.to_i
            @interval_1m_tel      += dh.interval_1m_tel.to_i
            @interval_1m_without  += dh.interval_1m_without.to_i
            @interval_2m_people   += dh.interval_2m_people.to_i
            @interval_2m_tel      += dh.interval_2m_tel.to_i
            @interval_2m_without  += dh.interval_2m_without.to_i
            @interval_3m_people   += dh.interval_3m_people.to_i
            @interval_3m_tel      += dh.interval_3m_tel.to_i
            @interval_3m_without  += dh.interval_3m_without.to_i
            @interval_4m_people   += dh.interval_4m_people.to_i
            @interval_4m_tel      += dh.interval_4m_tel.to_i
            @interval_4m_without  += dh.interval_4m_without.to_i
            @interval_6m_people   += dh.interval_6m_people.to_i
            @interval_6m_tel      += dh.interval_6m_tel.to_i
            @interval_6m_without  += dh.interval_6m_without.to_i
            @spt2                 += dh.spt2.to_i
            @spt1                 += dh.spt1.to_i
            @g_p_heavy_defense    += dh.g_p_heavy_defense.to_i
            @no_of_referrals      += dh.no_of_referrals.to_i
            @oral_func            += dh.oral_func.to_i
            @med_prac_rev         += dh.med_prac_rev.to_i
            @act_med_exam_days    += dh.act_med_exam_days.to_i
            @one_day_no_reservation += dh.one_day_no_reservation.to_i
       end 
       if @dh_aggregations[index+1].nil? 
            $total_no_of_reservations     += @no_of_reservations
            $total_people_maintenance     += @people_maintenance
            $total_people_treatment       += @people_treatment
            $total_people_own_expense     += @people_own_expense
            $total_people_i               += @people_maintenance + @people_treatment + @people_own_expense
            $total_oral_count             += @oral_count
            $total_out_of_the_decline     += @out_of_the_decline
            $total_cancellation_tel       += @cancellation_tel
            # $total_cancellation_percent     += number_with_precision((@cancellation_tel.to_f/@no_of_reservations.to_f)*100, precision: 2)
            $total_cancellation_without   += @cancellation_without
            $total_cancellation           += @cancellation_tel + @cancellation_without
            $total_insurance_maintenance  += @insurance_maintenance
            $total_insurance_treatment    += @insurance_treatment
            $total_score_meter            += @insurance_maintenance + @insurance_treatment
            $total_oral_func              += @oral_func
            $total_own_income             += @own_income
            $total_med_prac_rev           += @med_prac_rev
            $total_total_insured          += @insurance_maintenance +  @insurance_treatment
            # $total_score_per             += number_with_precision(@total_insured.to_f/@no_of_reservations.to_f, precision: 2)
            $total_miscc_income           += @miscc_income
            $total_no_of_people           += @no_of_people
            $total_appt_confm_people      += @appt_confm_people
            $total_interval_1m_people     += @interval_1m_people
            $total_interval_1m_tel        += @interval_1m_tel
            $total_interval_1m_without    += @interval_1m_without
            $total_interval_2m_people     += @interval_2m_people
            $total_interval_2m_tel        += @interval_2m_tel
            $total_interval_2m_without    += @interval_2m_without
            $total_interval_3m_people     += @interval_3m_people
            $total_interval_3m_tel        += @interval_3m_tel
            $total_interval_3m_without    += @interval_3m_without
            $total_interval_4m_people     += @interval_4m_people
            $total_interval_4m_tel        += @interval_4m_tel
            $total_interval_4m_without    += @interval_4m_without
            $total_interval_6m_people     += @interval_6m_people
            $total_interval_6m_tel        += @interval_6m_tel
            $total_interval_6m_without    += @interval_6m_without
            $total_overall_recall         += @overall_recall.to_i
            $total_spt2                   += @spt2
            $total_spt1                   += @spt1
            $total_g_p_heavy_defense      += @g_p_heavy_defense
            $total_no_of_referrals        += @no_of_referrals
            $total_act_med_exam_days      += @act_med_exam_days
            $total_one_day_no_reservation += @one_day_no_reservation
            $total_number_of_records += 1
            @i="final_data" 
       elsif @dh_aggregations[index+1].created_at.strftime("%Y-%m-%d") == dh.created_at.strftime("%Y-%m-%d") 
            @i="not_final_data" 
       else 
            $total_no_of_reservations    += @no_of_reservations
            $total_people_maintenance    += @people_maintenance
            $total_people_treatment      += @people_treatment
            $total_people_own_expense    += @people_own_expense
            $total_people_i              += @people_maintenance + @people_treatment + @people_own_expense
            $total_oral_count            += @oral_count
            $total_out_of_the_decline    += @out_of_the_decline
            $total_cancellation_tel      += @cancellation_tel
            $total_cancellation_without  += @cancellation_without
            $total_cancellation          += @cancellation_tel + @cancellation_without
            $total_insurance_maintenance += @insurance_maintenance
            $total_insurance_treatment   += @insurance_treatment
            $total_score_meter           += @insurance_maintenance + @insurance_treatment
            $total_oral_func             += @oral_func
            $total_own_income            += @own_income
            $total_med_prac_rev          += @med_prac_rev
            $total_total_insured         += @insurance_maintenance +  @insurance_treatment
            $total_miscc_income           += @miscc_income
            $total_no_of_people           += @no_of_people
            $total_appt_confm_people      += @appt_confm_people
            $total_interval_1m_people     += @interval_1m_people
            $total_interval_1m_tel        += @interval_1m_tel
            $total_interval_1m_without    += @interval_1m_without
            $total_interval_2m_people     += @interval_2m_people
            $total_interval_2m_tel        += @interval_2m_tel
            $total_interval_2m_without    += @interval_2m_without
            $total_interval_3m_people     += @interval_3m_people
            $total_interval_3m_tel        += @interval_3m_tel
            $total_interval_3m_without    += @interval_3m_without
            $total_interval_4m_people     += @interval_4m_people
            $total_interval_4m_tel        += @interval_4m_tel
            $total_interval_4m_without    += @interval_4m_without
            $total_interval_6m_people     += @interval_6m_people
            $total_interval_6m_tel        += @interval_6m_tel
            $total_interval_6m_without    += @interval_6m_without
            $total_overall_recall         += @overall_recall.to_i
            $total_spt2                   += @spt2
            $total_spt1                   += @spt1
            $total_g_p_heavy_defense      += @g_p_heavy_defense
            $total_no_of_referrals        += @no_of_referrals
            $total_act_med_exam_days      += @act_med_exam_days
            $total_one_day_no_reservation += @one_day_no_reservation
            $total_number_of_records     += 1
            @i="final_data"              
       end 

       @total_people         = @people_maintenance + @people_treatment + @people_own_expense
       @cancellation_percent = number_with_precision(@cancellation_tel.to_f/@no_of_reservations.to_f, precision: 2)
       @cancellation_without_percent = number_with_precision(@cancellation_without.to_f/@no_of_reservations.to_f, precision: 2)
       @cancel_total         = @cancellation_tel + @cancellation_without
       @cancel_total_percent =  number_with_precision(@cancel_total.to_f/@no_of_reservations.to_f, precision: 2)
       @score_meter          = @insurance_maintenance + @insurance_treatment
       @pass_rate_percent    = number_with_precision(@no_of_people.to_f/@no_of_reservations.to_f, precision: 2)
       @appt_percent         = number_with_precision(@appt_confm_people.to_f/@no_of_reservations.to_f, precision: 2)
       @overall_recall       = @interval_1m_people + @interval_1m_tel + @interval_1m_without + @interval_2m_people + @interval_2m_tel +
                               @interval_2m_without + @interval_3m_people + @interval_3m_tel + @interval_3m_without + @interval_4m_people +
                               @interval_4m_tel + @interval_4m_without + @interval_6m_people + @interval_6m_tel + @interval_6m_without
       @total_insured        = @insurance_maintenance +  @insurance_treatment   
       @score_per            = number_with_precision(@total_insured.to_f/@no_of_reservations.to_f, precision: 2)
       @daily_average        = number_with_precision(@act_med_exam_days.to_f/@no_of_reservations.to_f, precision: 2)   
       
       #----------total_percent-------#

        $total_cancel_tel_percent   = number_with_precision($total_cancellation_tel.to_f/$total_no_of_reservations.to_f, precision: 2)
        $total_cancel_with_percent  = number_with_precision($total_cancellation_without.to_f/$total_no_of_reservations.to_f, precision: 2)
        $total_cancel_percent       = number_with_precision($total_cancellation.to_f/$total_no_of_reservations.to_f, precision: 2)
        $total_no_of_people_percent = number_with_precision($total_no_of_people.to_f/$total_no_of_reservations.to_f, precision: 2)
        $total_appt_percent         = number_with_precision($total_appt_confm_people.to_f/$total_no_of_reservations.to_f, precision: 2)
        $daily_average_percent      = number_with_precision($total_act_med_exam_days.to_f/$total_no_of_reservations.to_f, precision: 2)

    end

    def dh_monthly(dh, index)

        @dh_aggregation = DhAggregation.where(clinic_id: current_user.clinic.id, dentist_hygienist_id: dh)
  
        @dh_aggregation = @dh_aggregation.where('extract(year from created_at) = ?', @year).where('extract(month from created_at) = ?', @month)

      
            @no_of_reservations   = @dh_aggregation.sum("CAST(COALESCE(no_of_reservations, '0') AS INTEGER)")
            @people_maintenance   = @dh_aggregation.sum("CAST(COALESCE(people_maintenance, '0') AS INTEGER)")
            @people_treatment     = @dh_aggregation.sum("CAST(COALESCE(people_treatment, '0') AS INTEGER)")
            @people_own_expense   = @dh_aggregation.sum("CAST(COALESCE(people_own_expense, '0') AS INTEGER)")
            @oral_count           = @dh_aggregation.sum("CAST(COALESCE(oral_count, '0') AS INTEGER)")
            @out_of_the_decline   = @dh_aggregation.sum("CAST(COALESCE(out_of_the_decline, '0') AS INTEGER)")
            @cancellation_tel     = @dh_aggregation.sum("CAST(COALESCE(cancellation_tel, '0') AS INTEGER)")
            @cancellation_without = @dh_aggregation.sum("CAST(COALESCE(cancellation_without, '0') AS INTEGER)")
            @insurance_maintenance= @dh_aggregation.sum("CAST(COALESCE(insurance_maintenance, '0') AS INTEGER)")
            @insurance_treatment  = @dh_aggregation.sum("CAST(COALESCE(insurance_treatment, '0') AS INTEGER)")
            @own_income           = @dh_aggregation.sum("CAST(COALESCE(own_income, '0') AS INTEGER)")
            @miscc_income         = @dh_aggregation.sum("CAST(COALESCE(miscc_income, '0') AS INTEGER)")
            @no_of_people         = @dh_aggregation.sum("CAST(COALESCE(no_of_people, '0') AS INTEGER)")
            @appt_confm_people    = @dh_aggregation.sum("CAST(COALESCE(appt_confm_people, '0') AS INTEGER)")
            @interval_1m_people   = @dh_aggregation.sum("CAST(COALESCE(interval_1m_people, '0') AS INTEGER)")
            @interval_1m_tel      = @dh_aggregation.sum("CAST(COALESCE(interval_1m_tel, '0') AS INTEGER)")
            @interval_1m_without  = @dh_aggregation.sum("CAST(COALESCE(interval_1m_without, '0') AS INTEGER)")
            @interval_2m_people   = @dh_aggregation.sum("CAST(COALESCE(interval_2m_people, '0') AS INTEGER)")
            @interval_2m_tel      = @dh_aggregation.sum("CAST(COALESCE(interval_2m_tel, '0') AS INTEGER)")
            @interval_2m_without  = @dh_aggregation.sum("CAST(COALESCE(interval_2m_without, '0') AS INTEGER)")
            @interval_3m_people   = @dh_aggregation.sum("CAST(COALESCE(interval_3m_people, '0') AS INTEGER)")
            @interval_3m_tel      = @dh_aggregation.sum("CAST(COALESCE(interval_3m_tel, '0') AS INTEGER)")
            @interval_3m_without  = @dh_aggregation.sum("CAST(COALESCE(interval_3m_without, '0') AS INTEGER)")
            @interval_4m_people   = @dh_aggregation.sum("CAST(COALESCE(interval_4m_people, '0') AS INTEGER)")
            @interval_4m_tel      = @dh_aggregation.sum("CAST(COALESCE(interval_4m_tel, '0') AS INTEGER)")
            @interval_4m_without  = @dh_aggregation.sum("CAST(COALESCE(interval_4m_without, '0') AS INTEGER)")
            @interval_6m_people   = @dh_aggregation.sum("CAST(COALESCE(interval_6m_people, '0') AS INTEGER)")
            @interval_6m_tel      = @dh_aggregation.sum("CAST(COALESCE(interval_6m_tel, '0') AS INTEGER)")
            @interval_6m_without  = @dh_aggregation.sum("CAST(COALESCE(interval_6m_without, '0') AS INTEGER)")
            @spt2                 = @dh_aggregation.sum("CAST(COALESCE(spt2, '0') AS INTEGER)")
            @spt1                 = @dh_aggregation.sum("CAST(COALESCE(spt1, '0') AS INTEGER)")
            @g_p_heavy_defense    = @dh_aggregation.sum("CAST(COALESCE(g_p_heavy_defense, '0') AS INTEGER)")
            @no_of_referrals      = @dh_aggregation.sum("CAST(COALESCE(no_of_referrals, '0') AS INTEGER)")
            @oral_func            = @dh_aggregation.sum("CAST(COALESCE(oral_func, '0') AS INTEGER)")
            @med_prac_rev         = @dh_aggregation.sum("CAST(COALESCE(med_prac_rev, '0') AS INTEGER)")
            @act_med_exam_days    = @dh_aggregation.sum("CAST(COALESCE(act_med_exam_days, '0') AS INTEGER)")
            @one_day_no_reservation = @dh_aggregation.sum("CAST(COALESCE(one_day_no_reservation, '0') AS INTEGER)")


            #total

            @people_total         = @people_maintenance + @people_treatment + @people_own_expense
            @cancellation_percent = number_with_precision(@cancellation_tel.to_f / @no_of_reservations.to_f, precision: 2)
            @cancellation_percent_with = number_with_precision(@cancellation_without.to_f / @no_of_reservations.to_f, precision: 2)
            @total_cancel         = @cancellation_tel + @cancellation_without
            @total_cancel_percent = number_with_precision(@total_cancel.to_f / @no_of_reservations.to_f, precision: 2)
            @own_expense          = @insurance_maintenance + @insurance_treatment
            @score_per            = number_with_precision(@own_expense.to_f / @no_of_reservations.to_f, precision: 2)
            @pass_rate_percent    = number_with_precision(@no_of_people.to_f / @no_of_reservations.to_f, precision: 2)
            @appt_confm_people_percent = number_with_precision(@appt_confm_people.to_f / @no_of_reservations.to_f, precision: 2)
            @overall_recall       = @interval_1m_people + @interval_1m_tel + @interval_1m_without + @interval_2m_people + @interval_2m_tel +
                                    @interval_2m_without + @interval_3m_people + @interval_3m_tel + @interval_3m_without + @interval_4m_people +
                                    @interval_4m_tel + @interval_4m_without + @interval_6m_people + @interval_6m_tel + @interval_6m_without
            @daily_average        =  number_with_precision(@act_med_exam_days.to_f/@no_of_reservations.to_f, precision: 2)     
            
            #------------total--------------------#
            $total_no_of_reservations     += @no_of_reservations
            $total_people_maintenance     += @people_maintenance
            $total_people_treatment       += @people_treatment
            $total_people_own_expense     += @people_own_expense
            $total_people_i               += @people_maintenance + @people_treatment + @people_own_expense
            $total_oral_count             += @oral_count
            $total_out_of_the_decline     += @out_of_the_decline
            $total_cancellation_tel       += @cancellation_tel
            $total_cancellation_without   += @cancellation_without
            $total_cancellation           += @cancellation_tel + @cancellation_without
            $total_insurance_maintenance  += @insurance_maintenance
            $total_insurance_treatment    += @insurance_treatment
            $total_score_meter            += @insurance_maintenance + @insurance_treatment
            $total_oral_func              += @oral_func
            $total_own_income             += @own_income
            $total_med_prac_rev           += @med_prac_rev
            $total_total_insured          += @insurance_maintenance +  @insurance_treatment unless @insurance_maintenance.present? && @insurance_treatment.present?
            $total_miscc_income           += @miscc_income
            $total_no_of_people           += @no_of_people
            $total_appt_confm_people      += @appt_confm_people
            $total_interval_1m_people     += @interval_1m_people
            $total_interval_1m_tel        += @interval_1m_tel
            $total_interval_1m_without    += @interval_1m_without
            $total_interval_2m_people     += @interval_2m_people
            $total_interval_2m_tel        += @interval_2m_tel
            $total_interval_2m_without    += @interval_2m_without
            $total_interval_3m_people     += @interval_3m_people
            $total_interval_3m_tel        += @interval_3m_tel
            $total_interval_3m_without    += @interval_3m_without
            $total_interval_4m_people     += @interval_4m_people
            $total_interval_4m_tel        += @interval_4m_tel
            $total_interval_4m_without    += @interval_4m_without
            $total_interval_6m_people     += @interval_6m_people
            $total_interval_6m_tel        += @interval_6m_tel
            $total_interval_6m_without    += @interval_6m_without
            $total_overall_recall         += @overall_recall.to_i
            $total_spt2                   += @spt2
            $total_spt1                   += @spt1
            $total_g_p_heavy_defense      += @g_p_heavy_defense
            $total_no_of_referrals        += @no_of_referrals
            $total_act_med_exam_days      += @act_med_exam_days
            $total_one_day_no_reservation += @one_day_no_reservation
            $total_number_of_records      += 1

            #---percent_total----#

            $total_cancel_tel_percent  = number_with_precision($total_cancellation_tel.to_f/$total_no_of_reservations.to_f, precision: 2)
            $total_cancel_with_percent = number_with_precision($total_cancellation_without.to_f/$total_no_of_reservations.to_f, precision: 2)
            $total_cancel_percent      = number_with_precision($total_cancellation.to_f/$total_no_of_reservations.to_f, precision: 2)
            $total_no_of_people_percent = number_with_precision($total_no_of_people.to_f/$total_no_of_reservations.to_f, precision: 2)
            $total_appt_percent        = number_with_precision($total_appt_confm_people.to_f/$total_no_of_reservations.to_f, precision: 2)
            $daily_average_percent  =  number_with_precision($total_act_med_exam_days.to_f/$total_no_of_reservations.to_f, precision: 2)
    end

    def dh_yearly(dh, index)
        if @dh_aggregations[index-1].created_at.strftime("%m") != dh.created_at.strftime("%m") || index == 0 
            @no_of_reservations   = dh.no_of_reservations.to_i
            @people_maintenance   = dh.people_maintenance.to_i
            @people_treatment     = dh.people_treatment.to_i
            @people_own_expense   = dh.people_own_expense.to_i
            @oral_count           = dh.oral_count.to_i
            @out_of_the_decline   = dh.out_of_the_decline.to_i
            @cancellation_tel     = dh.cancellation_tel.to_i
            @cancellation_without = dh.cancellation_without.to_i
            @insurance_maintenance= dh.insurance_maintenance.to_i
            @insurance_treatment  = dh.insurance_treatment.to_i
            @own_income           = dh.own_income.to_i
            @miscc_income         = dh.miscc_income.to_i
            @no_of_people         = dh.no_of_people.to_i
            @appt_confm_people    = dh.appt_confm_people.to_i
            @interval_1m_people   = dh.interval_1m_people.to_i
            @interval_1m_tel      = dh.interval_1m_tel.to_i
            @interval_1m_without  = dh.interval_1m_without.to_i
            @interval_2m_people   = dh.interval_2m_people.to_i
            @interval_2m_tel      = dh.interval_2m_tel.to_i
            @interval_2m_without  = dh.interval_2m_without.to_i
            @interval_3m_people   = dh.interval_3m_people.to_i
            @interval_3m_tel      = dh.interval_3m_tel.to_i
            @interval_3m_without  = dh.interval_3m_without.to_i
            @interval_4m_people   = dh.interval_4m_people.to_i
            @interval_4m_tel      = dh.interval_4m_tel.to_i
            @interval_4m_without  = dh.interval_4m_without.to_i
            @interval_6m_people   = dh.interval_6m_people.to_i
            @interval_6m_tel      = dh.interval_6m_tel.to_i
            @interval_6m_without  = dh.interval_6m_without.to_i
            @spt2                 = dh.spt2.to_i
            @spt1                 = dh.spt1.to_i
            @g_p_heavy_defense    = dh.g_p_heavy_defense.to_i
            @no_of_referrals      = dh.no_of_referrals.to_i
            @oral_func            = dh.oral_func.to_i
            @med_prac_rev         = dh.med_prac_rev.to_i
            @act_med_exam_days    = dh.act_med_exam_days.to_i
            @one_day_no_reservation = dh.one_day_no_reservation.to_i
         else
            @no_of_reservations   += dh.no_of_reservations.to_i
            @people_maintenance   += dh.people_maintenance.to_i 
            @people_treatment     += dh.people_treatment.to_i
            @people_own_expense   += dh.people_own_expense.to_i
            @oral_count           += dh.oral_count.to_i  
            @out_of_the_decline   += dh.out_of_the_decline.to_i
            @cancellation_tel     += dh.cancellation_tel.to_i
            @cancellation_without += dh.cancellation_without.to_i
            @insurance_maintenance+= dh.insurance_maintenance.to_i
            @insurance_treatment  += dh.insurance_treatment.to_i
            @own_income           += dh.own_income.to_i
            @miscc_income         += dh.miscc_income.to_i
            @no_of_people         += dh.no_of_people.to_i 
            @appt_confm_people    += dh.appt_confm_people.to_i
            @interval_1m_people   += dh.interval_1m_people.to_i
            @interval_1m_tel      += dh.interval_1m_tel.to_i
            @interval_1m_without  += dh.interval_1m_without.to_i
            @interval_2m_people   += dh.interval_2m_people.to_i
            @interval_2m_tel      += dh.interval_2m_tel.to_i
            @interval_2m_without  += dh.interval_2m_without.to_i
            @interval_3m_people   += dh.interval_3m_people.to_i
            @interval_3m_tel      += dh.interval_3m_tel.to_i
            @interval_3m_without  += dh.interval_3m_without.to_i
            @interval_4m_people   += dh.interval_4m_people.to_i
            @interval_4m_tel      += dh.interval_4m_tel.to_i
            @interval_4m_without  += dh.interval_4m_without.to_i
            @interval_6m_people   += dh.interval_6m_people.to_i
            @interval_6m_tel      += dh.interval_6m_tel.to_i
            @interval_6m_without  += dh.interval_6m_without.to_i
            @spt2                 += dh.spt2.to_i
            @spt1                 += dh.spt1.to_i
            @g_p_heavy_defense    += dh.g_p_heavy_defense.to_i
            @no_of_referrals      += dh.no_of_referrals.to_i
            @oral_func            += dh.oral_func.to_i
            @med_prac_rev         += dh.med_prac_rev.to_i
            @act_med_exam_days    += dh.act_med_exam_days.to_i
            @one_day_no_reservation += dh.one_day_no_reservation.to_i
        end 
        if @dh_aggregations[index+1].nil? 
            $total_no_of_reservations     += @no_of_reservations
            $total_people_maintenance     += @people_maintenance
            $total_people_treatment       += @people_treatment
            $total_people_own_expense     += @people_own_expense
            $total_people_i               += @people_maintenance + @people_treatment + @people_own_expense
            $total_oral_count             += @oral_count
            $total_out_of_the_decline     += @out_of_the_decline
            $total_cancellation_tel       += @cancellation_tel
            $total_cancellation_without   += @cancellation_without
            $total_cancellation           += @cancellation_tel + @cancellation_without
            $total_insurance_maintenance  += @insurance_maintenance
            $total_insurance_treatment    += @insurance_treatment
            $total_score_meter            += @insurance_maintenance + @insurance_treatment
            $total_oral_func              += @oral_func
            $total_own_income             += @own_income
            $total_med_prac_rev           += @med_prac_rev
            $total_total_insured          += @insurance_maintenance +  @insurance_treatment
            $total_miscc_income           += @miscc_income
            $total_no_of_people           += @no_of_people
            $total_appt_confm_people      += @appt_confm_people
            $total_interval_1m_people     += @interval_1m_people
            $total_interval_1m_tel        += @interval_1m_tel
            $total_interval_1m_without    += @interval_1m_without
            $total_interval_2m_people     += @interval_2m_people
            $total_interval_2m_tel        += @interval_2m_tel
            $total_interval_2m_without    += @interval_2m_without
            $total_interval_3m_people     += @interval_3m_people
            $total_interval_3m_tel        += @interval_3m_tel
            $total_interval_3m_without    += @interval_3m_without
            $total_interval_4m_people     += @interval_4m_people
            $total_interval_4m_tel        += @interval_4m_tel
            $total_interval_4m_without    += @interval_4m_without
            $total_interval_6m_people     += @interval_6m_people
            $total_interval_6m_tel        += @interval_6m_tel
            $total_interval_6m_without    += @interval_6m_without
            $total_overall_recall         += @overall_recall.to_i
            $total_spt2                   += @spt2
            $total_spt1                   += @spt1
            $total_g_p_heavy_defense      += @g_p_heavy_defense
            $total_no_of_referrals        += @no_of_referrals
            $total_act_med_exam_days      += @act_med_exam_days
            $total_one_day_no_reservation += @one_day_no_reservation
            $total_number_of_records += 1
            @i="final_data" 
         elsif @dh_aggregations[index+1].created_at.strftime("%m") == dh.created_at.strftime("%m") 
            @i="not_final_data" 
         else 
            $total_no_of_reservations    += @no_of_reservations
            $total_people_maintenance    += @people_maintenance
            $total_people_treatment      += @people_treatment
            $total_people_own_expense    += @people_own_expense
            $total_people_i              += @people_maintenance + @people_treatment + @people_own_expense
            $total_oral_count            += @oral_count
            $total_out_of_the_decline    += @out_of_the_decline
            $total_cancellation_tel      += @cancellation_tel
            $total_cancellation_without  += @cancellation_without
            $total_cancellation          += @cancellation_tel + @cancellation_without
            $total_insurance_maintenance += @insurance_maintenance
            $total_insurance_treatment   += @insurance_treatment
            $total_score_meter           += @insurance_maintenance + @insurance_treatment
            $total_oral_func             += @oral_func
            $total_own_income            += @own_income
            $total_med_prac_rev          += @med_prac_rev
            $total_total_insured         += @insurance_maintenance +  @insurance_treatment
            $total_miscc_income           += @miscc_income
            $total_no_of_people           += @no_of_people
            $total_appt_confm_people      += @appt_confm_people
            $total_interval_1m_people     += @interval_1m_people
            $total_interval_1m_tel        += @interval_1m_tel
            $total_interval_1m_without    += @interval_1m_without
            $total_interval_2m_people     += @interval_2m_people
            $total_interval_2m_tel        += @interval_2m_tel
            $total_interval_2m_without    += @interval_2m_without
            $total_interval_3m_people     += @interval_3m_people
            $total_interval_3m_tel        += @interval_3m_tel
            $total_interval_3m_without    += @interval_3m_without
            $total_interval_4m_people     += @interval_4m_people
            $total_interval_4m_tel        += @interval_4m_tel
            $total_interval_4m_without    += @interval_4m_without
            $total_interval_6m_people     += @interval_6m_people
            $total_interval_6m_tel        += @interval_6m_tel
            $total_interval_6m_without    += @interval_6m_without
            $total_overall_recall         += @overall_recall.to_i
            $total_spt2                   += @spt2
            $total_spt1                   += @spt1
            $total_g_p_heavy_defense      += @g_p_heavy_defense
            $total_no_of_referrals        += @no_of_referrals
            $total_act_med_exam_days      += @act_med_exam_days
            $total_one_day_no_reservation += @one_day_no_reservation
            $total_number_of_records     += 1
            @i="final_data" 
          
          

        end 

        @total_people         = @people_maintenance + @people_treatment + @people_own_expense
        @cancellation_percent = number_with_precision(@cancellation_tel.to_f/@no_of_reservations.to_f, precision: 2)
        @cancellation_without_percent = number_with_precision((@cancellation_without.to_f/@no_of_reservations.to_f)*100, precision: 2)
        @cancel_total         = @cancellation_tel + @cancellation_without
        @cancel_total_percent =  number_with_precision(@cancel_total.to_f/@no_of_reservations.to_f, precision: 2)
        @score_meter          = @insurance_maintenance + @insurance_treatment
        @pass_rate_percent    = number_with_precision(@no_of_people.to_f/@no_of_reservations.to_f, precision: 2)
        @appt_percent         = number_with_precision(@appt_confm_people.to_f/@no_of_reservations.to_f, precision: 2)
        @overall_recall       = @interval_1m_people + @interval_1m_tel + @interval_1m_without + @interval_2m_people + @interval_2m_tel +
                                @interval_2m_without + @interval_3m_people + @interval_3m_tel + @interval_3m_without + @interval_4m_people +
                                @interval_4m_tel + @interval_4m_without + @interval_6m_people + @interval_6m_tel + @interval_6m_without
        @total_insured        = @insurance_maintenance +  @insurance_treatment   
        @score_per            = number_with_precision(@total_insured.to_f/@no_of_reservations.to_f, precision: 2)
        @daily_average        = number_with_precision(@act_med_exam_days.to_f/@no_of_reservations.to_f, precision: 2)  
        
        #----------total_percent--------#

        $total_cancel_tel_percent   = number_with_precision($total_cancellation_tel.to_f/$total_no_of_reservations.to_f, precision: 2)
        $total_cancel_with_percent  = number_with_precision($total_cancellation_without.to_f/$total_no_of_reservations.to_f, precision: 2)
        $total_cancel_percent       = number_with_precision($total_cancellation.to_f/$total_no_of_reservations.to_f, precision: 2)
        $total_no_of_people_percent = number_with_precision($total_no_of_people.to_f/$total_no_of_reservations.to_f, precision: 2)
        $total_appt_percent         = number_with_precision($total_appt_confm_people.to_f/$total_no_of_reservations.to_f, precision: 2)
        $daily_average_percent      =  number_with_precision($total_act_med_exam_days.to_f/$total_no_of_reservations.to_f, precision: 2)

        #-----------cancel Percent ------#

        $total_cancel_graph_percent = number_with_precision($total_cancellation.to_f/$total_no_of_reservations.to_f, precision: 2)

    end
end
