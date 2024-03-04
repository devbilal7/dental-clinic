module CounselingsHelper

    def consultant_list(consultant_id,role)
        params[:aggregation_period].present? ? params[:aggregation_period] : params[:aggregation_period] = "All"
        counselings = CounselingAggregation::AggregationBasicFilter.new(params[:aggregation_period], "Counseling").aggregation_filter
        if role == "DR"
            @consultant = counselings.joins(:patient).where(patient: {clinic_id: current_user.clinic.id,dentist_id: consultant_id})
        elsif role == "DH"
            @consultant = counselings.joins(:patient).where(patient: {clinic_id: current_user.clinic.id,dentist_hygienist_id: consultant_id})
        else  
            @consultant = counselings.joins(:patient).where(patient: {clinic_id: current_user.clinic.id,treatment_coordinator_id: consultant_id})
        end 
        
        # # Searching 
        if params[:first_re_first_rate].present? 
            first_visit = number_with_precision(@consultant.pluck(:first_visit).compact.count.to_f/@consultant.count,precision: 2).to_f
            re_first_visit = number_with_precision(@consultant.pluck(:re_first_visit).compact.count.to_f/@consultant.count,precision: 2).to_f

            unless first_visit == re_first_visit && first_visit == params[:first_re_first_rate].to_f && re_first_visit == params[:first_re_first_rate].to_f    
                @consultant = []
            end
        end 
        
        if params[:re_first_visit].present?
            re_first_visit = @consultant.pluck(:re_first_visit).compact.count.to_f
            unless re_first_visit.to_i == params[:re_first_visit].to_i 
                @consultant = []
            end    
            
        end 
        
        if params[:receipts].present?
            receipts = @consultant.pluck(:cons_sign_date).compact.count.to_f 
            unless receipts.to_i == params[:receipts].to_i 
                @consultant = []
            end 
        end 
        
        # binding.pry
        counting(@consultant.to_a)
         

    end 

    def all 
        total_counseling = Counseling.joins(:patient).where(patient: {clinic_id: current_user.clinic.id}).to_a
        @total_counseling_count = total_counseling.count

        counting(total_counseling)
    end 

    def individual_consultant(data,all_counselings)
        counting(data)
        @total_first_visit = all_counselings.to_a.pluck(:first_visit).reject{|m| m == ""}.count 
        @total_refirst_visit = all_counselings.to_a.pluck(:refirst_visit).reject{|m| m == ""}.count 

        a = Course.where(name: "A")
        b = Course.where(name: "B")
        c = Course.where(name: "C")
        d = Course.where(name: "D")
        e = Course.where(name: "E")

        i_id = Pcourse.where(name: "I")
        ah_id = Pcourse.where(name: "Ah")
        hare_id = Pcourse.where(name: "HARE")

        @a_count = data.pluck(:course_id).tally[a.ids[0]] || 0
        @b_count = data.pluck(:course_id).tally[b.ids[0]] || 0
        @c_count = data.pluck(:course_id).tally[c.ids[0]] || 0
        @d_count = data.pluck(:course_id).tally[d.ids[0]] || 0
        @e_count = data.pluck(:course_id).tally[e.ids[0]] || 0

        @i_count = data.pluck(:pcourse_id).tally[i_id.ids[0]] || 0
        @ah_count = data.pluck(:pcourse_id).tally[ah_id.ids[0]] || 0
        @hare_count = data.pluck(:pcourse_id).tally[hare_id.ids[0]] || 0

        @total = @prostho + @denture + @invisalign + @implant + @other_correc + @micro + @whitening
    end 


    def counting(consultant)
        if consultant.present? 
            @count = consultant.count 
            @first_visit = consultant.pluck(:first_visit).compact.count
            @re_first_visit  = consultant.pluck(:re_first_visit).compact.count
            @emergency = consultant.pluck(:emergency).compact.count 
            @second_visit    = consultant.pluck(:second_visit).compact.count
            @treat_plan  = consultant.pluck(:treat_plan).compact.count
            @p_consult   = consultant.pluck(:p_consult).compact.count
            @inspection  = consultant.pluck(:inspection).compact.count
            @prostho = consultant.pluck(:prostho).compact.count
            @denture = consultant.pluck(:denture).compact.count
            @whitening   = consultant.pluck(:whitening).compact.count
            @implant = consultant.pluck(:implant).compact.count
            @invisalign  = consultant.pluck(:invisalign).compact.count
            @other_correc    = consultant.pluck(:other_correc).compact.count
            @micro   = consultant.pluck(:micro).compact.count
            @maintainance = consultant.pluck(:maintainance).compact.count
            @main_resv_date  = consultant.pluck(:main_resv_date).compact.count
            # @main_trans  = consultant.pluck(:main_trans).reject{|m| m == ""}.count
            # @type_agree  = consultant.pluck(:type_agree).reject{|m| m == ""}.count
            # @prostho_type    = consultant.pluck(:prostho_type).reject{|m| m == ""}.count
            # @no_of_implant   = consultant.pluck(:no_of_implant).reject{|m| m == ""}.count
            # @site    = consultant.pluck(:site).reject{|m| m == ""}.count
            # @offer_amt   = consultant.pluck(:offer_amt).reject{|m| m == ""}.count
            # @agreement   = consultant.pluck(:agreement).reject{|m| m == ""}.count
            @cons_sign_date  = consultant.pluck(:cons_sign_date).compact.count
            @contract_amt   = consultant.pluck(:contract_amt).compact.reject{|m| m == ""}.map(&:to_i).sum

            all_oral_data = consultant.map{|m| m.oral_types}.flatten

            oral_breath = all_oral_data.reject{|r| r.name != "bad_breath"}
            @bad_breath_exp = oral_breath.pluck(:exp_date).compact.count
            @bad_breath_imp = oral_breath.pluck(:imp_date).compact.count

            oral_microscope = all_oral_data.reject{|r| r.name != "microscope"}
            @microscope_exp = oral_microscope.pluck(:exp_date).compact.count
            @microscope_imp = oral_microscope.pluck(:imp_date).compact.count

            oral_saliva = all_oral_data.reject{|r| r.name != "saliva"}
            @saliva_exp = oral_saliva.pluck(:exp_date).compact.count
            @saliva_imp = oral_saliva.pluck(:imp_date).compact.count
            @total = @first_visit + @re_first_visit + @second_visit + @treat_plan + @p_consult + @inspection + @prostho + @denture + @whitening + @implant + @invisalign + @other_correc + @micro + @maintainance + @bad_breath_imp + @bad_breath_exp + @microscope_exp + @microscope_imp + @saliva_imp + @saliva_exp

            # Rate 

            @first_visit_rate = number_with_precision(@first_visit.to_f/@count,:precision => 2)
            @re_first_visit_rate = number_with_precision(@re_first_visit.to_f/@count,:precision => 2)
            @second_visit_rate = number_with_precision(@second_visit.to_f/ @count + @re_first_visit, :precision => 2)
            @treat_plan_rate = number_with_precision(@treat_plan.to_f/ @second_visit, :precision => 2)
            @p_consult_rate = number_with_precision(@p_consult.to_f/ @count, :precision => 2)
            @inspection_rate = number_with_precision(@inspection.to_f/ @count, :precision => 2)   
            @prostho_rate = number_with_precision(@prostho.to_f/ @count, :precision => 2)
            @denture_rate = number_with_precision(@denture.to_f/ @count, :precision => 2)
            @whitening_rate = number_with_precision(@whitening.to_f/ @count, :precision => 2)
            @implant_rate = number_with_precision(@implant.to_f/ @count, :precision => 2)
            @invisalign_rate = number_with_precision(@invisalign.to_f/ @count, :precision => 2)
            @other_correc_rate = number_with_precision(@other_correc.to_f/ @count, :precision => 2)
            @micro_rate = number_with_precision(@micro.to_f/ @count, :precision => 2)
            @maintainance_rate = number_with_precision(@maintainance.to_f/ @count, :precision => 2)
            @bad_breath_exp_rate = number_with_precision(@bad_breath_exp.to_f/ @count, :precision => 2)
            @bad_breath_imp_rate = number_with_precision(@bad_breath_imp.to_f/ @count, :precision => 2)
            @microscope_exp_rate = number_with_precision(@microscope_exp.to_f/ @count, :precision => 2)
            @microscope_imp_rate = number_with_precision(@microscope_imp.to_f/ @count, :precision => 2)
            @saliva_exp_rate = number_with_precision(@saliva_exp.to_f/ @count, :precision => 2)
            @saliva_imp_rate = number_with_precision(@saliva_imp.to_f/ @count, :precision => 2)
        end
    end 
    def batting_average(data)
        @total_contract = data.count

        @prosthodontics_consultant = data.pluck(:prostho).reject{|p| p == nil }.count
        @prosthodontics_batting_average = @prosthodontics_consultant.to_f/@total_contract.to_f unless @total_contract == 0

        @denture_consultant = data.pluck(:denture).reject{|p| p == nil }.count
        @denture_batting_average = @denture_consultant.to_f/@total_contract.to_f unless @total_contract == 0

        @implant_consultant = data.pluck(:implant).reject{|p| p == nil }.count
        @implant_batting_average = @implant_consultant.to_f/@total_contract.to_f unless @total_contract == 0

        @invisalign_consultant = data.pluck(:invisalign).reject{|p| p == nil }.count
        @invisalign_batting_average = @invisalign_consultant.to_f/@total_contract.to_f unless @total_contract == 0

        @other_correct_consultant = data.pluck(:other_correc).reject{|p| p == nil }.count
        @other_correct_batting_average = @other_correct_consultant.to_f/@total_contract.to_f unless @total_contract == 0

        @micro_consultant = data.pluck(:micro).reject{|p| p == nil }.count
        @micro_batting_average = @micro_consultant.to_f/@total_contract.to_f unless @total_contract == 0

        @whitening_consultant = data.pluck(:whitening).reject{|p| p == nil }.count
        @whitening_batting_average = @whitening_consultant.to_f/@total_contract.to_f unless @total_contract == 0   
        # Total 
        @total_target_value = @total_contract * 7 
        
        @total = @prosthodontics_consultant + @denture_consultant + @implant_consultant + @invisalign_consultant + @other_correct_consultant + @micro_consultant + @whitening_consultant
        
        @whitening_amt = data.reject{|p| p.whitening == nil }.pluck(:contract_amt).map(&:to_i).sum 
        @whitening_target_amt = data.reject{|p| p.whitening == nil }.pluck(:offer_amt).map(&:to_i).sum * @total_contract
        @whitening_rate = number_with_precision(@whitening_amt.to_f / @whitening_target_amt.to_f,:precision => 2)

        @micro_amt = data.reject{|p| p.micro == nil }.pluck(:contract_amt).map(&:to_i).sum 
        @micro_target_amt = data.reject{|p| p.micro == nil }.pluck(:offer_amt).map(&:to_i).sum * @total_contract
        @micro_rate = number_with_precision(@micro_amt.to_f / @micro_target_amt.to_f,:precision => 2)

        @implant_amt = data.reject{|p| p.implant == nil }.pluck(:contract_amt).map(&:to_i).sum 
        @implant_target_amt = data.reject{|p| p.implant == nil }.pluck(:offer_amt).map(&:to_i).sum * @total_contract
        @implant_rate = number_with_precision(@implant_amt.to_f / @implant_target_amt.to_f,:precision => 2)

        @prosthodontics_amt = data.reject{|p| p.prostho == nil }.pluck(:contract_amt).map(&:to_i).sum 
        @prosthodontics_target_amt = data.reject{|p| p.prostho == nil }.pluck(:offer_amt).map(&:to_i).sum * @total_contract
        @prosthodontics_rate = number_with_precision(@prosthodontics_amt.to_f / @prosthodontics_target_amt.to_f,:precision => 2)

        @denture_amt = data.reject{|p| p.denture == nil }.pluck(:contract_amt).map(&:to_i).sum 
        @denture_target_amt = data.reject{|p| p.denture == nil }.pluck(:offer_amt).map(&:to_i).sum * @total_contract
        @denture_rate = number_with_precision(@denture_amt.to_f / @denture_target_amt.to_f,:precision => 2)

        @invisalign_amt = data.reject{|p| p.invisalign == nil }.pluck(:contract_amt).map(&:to_i).sum 
        @invisalign_target_amt = data.reject{|p| p.invisalign == nil }.pluck(:offer_amt).map(&:to_i).sum * @total_contract
        @invisalign_rate = number_with_precision(@invisalign_amt.to_f / @invisalign_target_amt.to_f,:precision => 2)

        @other_correc_amt = data.reject{|p| p.other_correc == nil }.pluck(:contract_amt).map(&:to_i).sum 
        @other_correc_target_amt = data.reject{|p| p.other_correc == nil }.pluck(:offer_amt).map(&:to_i).sum * @total_contract
        @other_correc_rate = number_with_precision(@other_correc_amt.to_f / @other_correc_target_amt.to_f,:precision => 2)

        @correct_amt = @invisalign_amt + @other_correc_amt 
        @correct_target_amt = @invisalign_target_amt + @other_correc_target_amt
        @correct_rate = number_with_precision(@correct_amt.to_f / @correct_target_amt.to_f,:precision => 2)

        @total_amt = @whitening_amt + @micro_amt + @implant_amt + @prosthodontics_amt + @denture_amt + @correct_amt
        @total_target_amt = @whitening_target_amt + @micro_target_amt + @implant_target_amt + @prosthodontics_target_amt + @denture_target_amt + @correct_target_amt
        
        @total_rate = number_with_precision(@total_amt.to_f / @total_target_amt.to_f,:precision => 2)
    end


    def individual_target(dentist,profession)
        indi_count = []
        hash_data = {}
        params[:aggregation_period].present? ? params[:aggregation_period] : params[:aggregation_period] = "All"
        patients = CounselingAggregation::AggregationBasicFilter.new(params[:aggregation_period], "Patient").aggregation_filter
        patients = patients.where(dentist_id: dentist.id,clinic_id: current_user.clinic.id)
        @amount = 0
        patients.each do |patient|
            if patient.counselings.last.present?           
                hash_data[:prostho] = patient.counselings.last.prostho   
                prostho = indi_count << {prostho: hash_data[:prostho]} unless hash_data[:prostho].nil? || hash_data[:prostho] == ""

                hash_data[:denture] = patient.counselings.last.denture   
                denture = indi_count << {denture: hash_data[:denture]} unless hash_data[:denture].nil?

                hash_data[:implant] = patient.counselings.last.implant   
                implant = indi_count << {implant: hash_data[:implant]} unless hash_data[:implant].nil?

                hash_data[:other_correc] = patient.counselings.last.other_correc   
                other_correc = indi_count << {other_correc: hash_data[:other_correc]} unless hash_data[:other_correc] == ""

                hash_data[:micro] = patient.counselings.last.micro   
                micro = indi_count << {micro: hash_data[:micro]} unless hash_data[:micro] == ""
                
                hash_data[:whitening] =  patient.counselings.last.whitening   
                whitening = indi_count << {whitening: hash_data[:whitening]} unless hash_data[:whitening].nil?

            end 
            @amount = patient.counselings.present? ? patient.counselings.last.contract_amt.to_i : 0
        end
        @prostho = indi_count.select{|x| x[:prostho]}.count
        @denture = indi_count.select{|x| x[:denture]}.count
        @implant = indi_count.select{|x| x[:implant]}.count
        @other_correc = indi_count.select{|x| x[:other_correc]}.count
        @micro = indi_count.select{|x| x[:micro]}.count
        @whitening = indi_count.select{|x| x[:whitening]}.count
        @total_dentist = @prostho + @denture + @implant + @other_correc + @micro + @whitening
        @total_amount = @prostho * @amount + @denture * @amount + @implant * @amount + @other_correc * @amount + @micro * @amount + @whitening * @amount
        
        if profession == "dr"
        @prostho_dr += @prostho if @prostho.present? 
        @denture_dr += @denture if @denture.present? 
        @implant_dr += @implant if @implant.present? 
        @other_correc_dr += @other_correc if @other_correc.present? 
        @micro_dr += @micro if @micro.present?
        @whitening_dr += @whitening if @whitening.present?

        @prostho_dr_amt += @prostho * @amount
        @denture_dr_amt += @denture * @amount
        @implant_dr_amt += @implant * @amount
        @other_correc_dr_amt += @other_correc * @amount
        @micro_dr_amt += @micro * @amount 
        @whitening_dr_amt += @whitening * @amount
        end 

        if profession == "dh"
        @prostho_dh += @prostho if @prostho.present? 
        @denture_dh += @denture if @denture.present? 
        @implant_dh += @implant if @implant.present? 
        @other_correc_dh += @other_correc if @other_correc.present? 
        @micro_dh += @micro if @micro.present?
        @whitening_dh += @whitening if @whitening.present?

        @prostho_dh_amt += @prostho * @amount 
        @denture_dh_amt += @denture * @amount
        @implant_dh_amt += @implant * @amount
        @other_correc_dh_amt += @other_correc * @amount
        @micro_dh_amt += @micro * @amount 
        @whitening_dh_amt += @whitening * @amount
        end 

        if profession == "tc"
        @prostho_tc += @prostho if @prostho.present? 
        @denture_tc += @denture if @denture.present? 
        @implant_tc += @implant if @implant.present? 
        @other_correc_tc += @other_correc if @other_correc.present? 
        @micro_tc += @micro if @micro.present?
        @whitening_tc += @whitening if @whitening.present?

        @prostho_tc_amt += @prostho * @amount
        @denture_tc_amt += @denture * @amount
        @implant_tc_amt += @implant * @amount
        @other_correc_tc_amt += @other_correc * @amount
        @micro_tc_amt += @micro * @amount 
        @whitening_tc_amt += @whitening * @amount
        end 
    end


end


# Number of times: Of the number of consultations, the number of cases for each person in charge

    # Rate: Calculate the ratio of the number of consultations for each person in charge using the following formula.
    # Initial consultation rate = number of initial consultations / number of new cases
    # Re-first visit = Number of re-first visits / Number of re-first visits
    # Second rate = Second number of times / New patient + Re-first visit
    # Treatment plan rate = number of treatment plans / number of second treatments
    # P consulting rate = number of P consultants / number of receipts
    # Inspection ③ rate = inspection ③ number of times / number of receipts
    # Prosthodontics rate = number of prostheses / number of receipts
    # Denture rate = number of dentures / number of receipts
    # Whitening rate = number of whitenings / number of receipts
    # Implant rate = number of implants / number of receipts
    # Invisa rate = number of invisas / number of receipts
    # Other correction rate = Number of other corrections / Number of receipts
    # Micro rate = number of micros / number of receipts
    # Maintenance rate = number of maintenance / number of receipts

    # Halitosis test explanation rate = number of halitosis test explanations / number of receipts
    # Halitosis inspection implementation rate = number of halitosis inspection implementations / number of receipts
    # Microscopic inspection explanation rate = Number of microscopic inspection explanations / Number of receipts
    # Microscopic examination implementation rate = number of microscopic examinations / number of receipts
    # Saliva test explanation rate = number of saliva test explanations / number of receipts
    # Saliva test implementation rate = number of saliva test implementations / number of receipts
