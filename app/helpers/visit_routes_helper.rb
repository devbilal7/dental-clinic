module VisitRoutesHelper

  def patient_progress(visits,month,year) 
    
    @visit_by_month = visits.select{|m| m.created_at.strftime("%Y") == year}.select{|m| m.created_at.strftime("%m").to_i == month}

    @visit_by_year = visits.to_a
    # Visit By Months 
    @first_visit = @visit_by_month.pluck(:first_visit).compact.count

    @second = @visit_by_month.pluck(:second).compact.count
    @treatment_plan_date = @visit_by_month.pluck(:treatment_plan_date).compact.count
    
    @implant_correction = @visit_by_month.pluck(:implant_correction).compact.count
    
    @self_pay_contract = @visit_by_month.pluck(:self_pay_contract).count(true)

    @maintenance = @visit_by_month.pluck(:maintenance).compact.count

    @treatment_plan = @visit_by_month.pluck(:treatment_plan).count(true)

    @suspension = @visit_by_month.pluck(:suspension).count(true)

    @confirmation_end = @visit_by_month.pluck(:confirmation_end).count(true)

    @maintenance_visit = @visit_by_month.pluck(:maintenance_visit).count(true)

    @suspension_contact_TEL = @visit_by_month.pluck(:contact_TEL).count(true)

    @suspended_contact_postcard = @visit_by_month.pluck(:contact_postcard).count(true)

    @visit_after_interruption = @visit_by_month.pluck(:visit_after_interruption).reject{|m| m==""}.count

    @p_heavy_defense_target = @visit_by_month.pluck(:p_heavy_defense_target).count(true)

    @p_heavy_defense_calculation = @visit_by_month.pluck(:p_heavy_defense_calculation).count(true)

    @inspection_4mm = @visit_by_month.pluck(:inspection_4mm).count(true)

    @p_second = @visit_by_month.pluck(:p_second).count(true)

    @inspection_3 = @visit_by_month.pluck(:inspection_3).count(true)

    @fop = @visit_by_month.pluck(:fop).count(true)

    @whitening = @visit_by_month.pluck(:whitening).count(true)

    @medical_tube = @visit_by_month.pluck(:medical_tube).count(true)

    @prosthodontics = @visit_by_month.pluck(:prosthodontics).reject{|m| m==""}.count

    @mt_tooth_number = @visit_by_month.pluck(:mt_tooth_number).reject{|m| m==""}.count

    @malocclusion = @visit_by_month.pluck(:malocclusion).count(true)

    @visit_count = @visit_by_month.count

    @next_reservation_date = @visit_by_month.pluck(:next_reservation_date).compact.count

    @end_date = @visit_by_month.pluck(:end_date).compact.count

    @inspection_4mm = @visit_by_month.pluck(:inspection_4mm).count(true) 

    @maintenance_visit_date = @visit_by_month.pluck(:maintenance_visit_date).compact.count


    # Visit By Year 

    @first_visit_of_year = @visit_by_year.pluck(:first_visit).compact.count

    @second_of_year = @visit_by_year.pluck(:second).compact.count

    @treatment_plan_date_of_year = @visit_by_year.pluck(:treatment_plan_date).compact.count

    @implant_correction_of_year = @visit_by_year.pluck(:implant_correction).compact.count

    @self_pay_contract_of_year = @visit_by_year.pluck(:self_pay_contract).count(true)

    @maintenance_of_year = @visit_by_year.pluck(:maintenance).compact.count

    @treatment_plan_of_year = @visit_by_year.pluck(:treatment_plan).count(true)

    @suspension_of_year = @visit_by_year.pluck(:suspension).count(true)

    @confirmation_end_of_year = @visit_by_year.pluck(:confirmation_end).count(true)

    @maintenance_visit_of_year = @visit_by_year.pluck(:maintenance_visit).count(true)

    @suspension_contact_TEL_of_year = @visit_by_year.pluck(:contact_TEL).count(true)

    @suspended_contact_postcard_of_year = @visit_by_year.pluck(:contact_postcard).count(true)

    @visit_after_interruption_of_year = @visit_by_year.pluck(:visit_after_interruption).reject{|m| m==""}.count

    @p_heavy_defense_target_of_year = @visit_by_year.pluck(:p_heavy_defense_target).count(true)

    @p_heavy_defense_calculation_of_year = @visit_by_year.pluck(:p_heavy_defense_calculation).count(true)

    @inspection_4mm_of_year = @visit_by_year.pluck(:inspection_4mm).count(true)

    @p_second_of_year = @visit_by_year.pluck(:p_second).count(true)

    @inspection_3_of_year = @visit_by_year.pluck(:inspection_3).count(true)

    @fop_of_year = @visit_by_year.pluck(:fop).count(true)

    @whitening_of_year = @visit_by_year.pluck(:whitening).count(true)

    @medical_tube_of_year = @visit_by_year.pluck(:medical_tube).count(true)

    @prosthodontics_of_year = @visit_by_year.pluck(:prosthodontics).reject{|m| m==""}.count

    @mt_tooth_number_of_year = @visit_by_year.pluck(:mt_tooth_number).reject{|m| m==""}.count

    @malocclusion_of_year = @visit_by_year.pluck(:malocclusion).count(true)

    @visit_count_of_year = @visit_by_year.count

    @next_reservation_date_of_year = @visit_by_year.pluck(:next_reservation_date).compact.count

    @end_dates_of_year = @visit_by_year.pluck(:end_date).compact.count
    
    @inspection_4mm_of_year = @visit_by_year.pluck(:inspection_4mm).count(true) 

    @maintenance_visit_date_of_year = @visit_by_year.pluck(:maintenance_visit_date).compact.count

    # Visit Count Monthly 
    @visit_monthly = @visit_by_month.count.to_f

    # Visit Count Yearly 
    @visit_yearly = @visit_by_year.count.to_f
  end 

  ## PCourse Monthly Data
  def course(courses,month,year) 
    
    @courses_by_month = courses.select{|m| m.created_at.strftime("%Y") == year}.select{|m| m.created_at.strftime("%m").to_i == month}

    if @courses_by_month.present?
    @courses_by_year = courses.to_a

    # Courses By Month
    @unknown_course = @courses_by_month.pluck(:unknown_course).reject{|m| m==""}.count
    @course_a = @courses_by_month.pluck(:course).count("A") 
    @course_b = @courses_by_month.pluck(:course).count("B") 
    @course_c = @courses_by_month.pluck(:course).count("C")
    @course_d = @courses_by_month.pluck(:course).count("D")
    @course_e = @courses_by_month.pluck(:course).count("E")
    @monthly_total = @course_a + @course_b + @course_c + @course_d + @course_e + @unknown_course

    # # Courses BY Year 
    # @unknown_course_year = @courses_by_year.pluck(:unknown_course).reject{|m| m==""}.count
    # @course_a_year = @courses_by_year.pluck(:course).count("A") 
    # @course_b_year = @courses_by_year.pluck(:course).count("B") 
    # @course_c_year = @courses_by_year.pluck(:course).count("C")
    # @course_d_year = @courses_by_year.pluck(:course).count("D")
    # @course_e_year = @courses_by_year.pluck(:course).count("E")
    # @yearly_total = @course_a_year + @course_b_year + @course_c_year + @course_d_year + @course_e_year + @unknown_course_year

    # @courses_by_year = courses.to_a
    # # Average Course
    # @average_new_cases = number_with_precision(@courses_by_year.count.to_f / @available_course_data,:precision => 2)
    # @average_unknown_courses = number_with_precision(@unknown_course_year.to_f / @available_course_data,:precision => 2)
    # @average_course_a = number_with_precision(@course_a_year.to_f / @available_course_data,:precision => 2) 
    # @average_course_b = number_with_precision(@course_b_year.to_f / @available_course_data,:precision => 2)
    # @average_course_c = number_with_precision(@course_c_year.to_f / @available_course_data,:precision => 2)
    # @average_course_d = number_with_precision(@course_d_year.to_f / @available_course_data,:precision => 2)
    # @average_course_e = number_with_precision(@course_e_year.to_f / @available_course_data,:precision => 2)
    # @average_yearly_total = number_with_precision(@yearly_total.to_f / @available_course_data,:precision => 2)
    
    # Monthly Course Count 
    @monthly_course_count = @courses_by_month.count.to_f 

    # Yearly Course Count 
    @yearly_course_count = @courses_by_year.count.to_f
    end  
  end 

  ## Course Total And Average
  def course_total_average(courses,available_course_data)
    @courses_by_year = courses.to_a

    # Courses BY Year 
    @unknown_course_year = @courses_by_year.pluck(:unknown_course).reject{|m| m==""}.count
    @course_a_year = @courses_by_year.pluck(:course).count("A") 
    @course_b_year = @courses_by_year.pluck(:course).count("B") 
    @course_c_year = @courses_by_year.pluck(:course).count("C")
    @course_d_year = @courses_by_year.pluck(:course).count("D")
    @course_e_year = @courses_by_year.pluck(:course).count("E")
    @yearly_total = @course_a_year + @course_b_year + @course_c_year + @course_d_year + @course_e_year + @unknown_course_year

    @courses_by_year = courses.to_a
    # Average Course
    @average_new_cases = number_with_precision(@courses_by_year.count.to_f / available_course_data,:precision => 2)
    @average_unknown_courses = number_with_precision(@unknown_course_year.to_f / available_course_data,:precision => 2)
    @average_course_a = number_with_precision(@course_a_year.to_f / available_course_data,:precision => 2) 
    @average_course_b = number_with_precision(@course_b_year.to_f / available_course_data,:precision => 2)
    @average_course_c = number_with_precision(@course_c_year.to_f / available_course_data,:precision => 2)
    @average_course_d = number_with_precision(@course_d_year.to_f / available_course_data,:precision => 2)
    @average_course_e = number_with_precision(@course_e_year.to_f / available_course_data,:precision => 2)
    @average_yearly_total = number_with_precision(@yearly_total.to_f / available_course_data,:precision => 2)
  end 

  ## PCourse Monthly Data
  def p_course(p_courses,month,year)
    @p_courses_by_month = p_courses.select{|m| m.created_at.strftime("%Y") == year}.select{|m| m.created_at.strftime("%m").to_i == month}

    if @p_courses_by_month.present?
      # Courses By Month
      @monthly_p_courses = @p_courses_by_month.pluck(:p_course).reject{|m| m==""}.count
      @p_course_ah = @p_courses_by_month.pluck(:p_course).count("a")
      @p_course_I = @p_courses_by_month.pluck(:p_course).count("b")
      @p_course_hare = @p_courses_by_month.pluck(:p_course).count("c")
      
      # Month Count 
      @p_courses_month_count = @p_courses_by_month.count 

    end 

    # # Courses BY Year 
    # @p_courses_by_year = p_courses.to_a
    # @p_course_ah_year = @p_courses_by_year.pluck(:p_course).count("a")
    # @p_course_I_year = @p_courses_by_year.pluck(:p_course).count("b")
    # @p_course_hare_year = @p_courses_by_year.pluck(:p_course).count("c")
    # @total_p_courses = @p_courses_by_year.pluck(:p_course).reject{|m| m==""}.count

    # # Year Count 
    # @p_courses_year_count = @p_courses_by_year.count 


    # # Average P Courses 
    # @average_cases = number_with_precision(@p_courses_year_count.to_f / @available_p_course_data,:precision => 2) 
    # @average_p_courses = number_with_precision(@total_p_courses.to_f / @available_p_course_data, :precision => 2)
    # @average_course_ah = number_with_precision(@p_course_ah_year.to_f / @available_p_course_data, :precision => 2)
    # @average_course_I = number_with_precision(@p_course_I_year.to_f / @available_p_course_data, :precision => 2)
    # @average_course_hare = number_with_precision(@p_course_hare_year.to_f / @available_p_course_data, :precision => 2)

  end 

  ## PCourse Total And Average 
  def pcourse_total_average(p_courses,available_p_course_data) 

    @p_courses_by_year = p_courses.to_a
    # Courses BY Year 
    @p_course_ah_year = @p_courses_by_year.pluck(:p_course).count("a")
    @p_course_I_year = @p_courses_by_year.pluck(:p_course).count("b")
    @p_course_hare_year = @p_courses_by_year.pluck(:p_course).count("c")
    @total_p_courses = @p_courses_by_year.pluck(:p_course).reject{|m| m==""}.count

    # Year Count 
    @p_courses_year_count = @p_courses_by_year.count 

    # Month Count 
    @p_courses_month_count = @p_courses_by_month.count 

    # Average P Courses 
    @average_cases = number_with_precision(@p_courses_year_count.to_f / available_p_course_data,:precision => 2) 
    @average_p_courses = number_with_precision(@total_p_courses.to_f / available_p_course_data, :precision => 2)
    @average_course_ah = number_with_precision(@p_course_ah_year.to_f / available_p_course_data, :precision => 2)
    @average_course_I = number_with_precision(@p_course_I_year.to_f / available_p_course_data, :precision => 2)
    @average_course_hare = number_with_precision(@p_course_hare_year.to_f / available_p_course_data, :precision => 2)
  end 


  def dentist_data(consultant,clinic_id,consultant_id) 

    if consultant == "overall"
      multiple_visit_route = MultipleVisitRoute.joins(:patient).where(patient: {clinic_id: clinic_id})

    elsif consultant == "dentist"
      multiple_visit_route = MultipleVisitRoute.joins(:patient).where(patient: {dentist_id: consultant_id, clinic_id: clinic_id})
      @dr = "DR"
      
    elsif consultant == "dentist_hygienist"
      multiple_visit_route = MultipleVisitRoute.joins(:patient).where(patient: {dentist_hygienist_id: consultant_id, clinic_id: clinic_id})
      @dr = "DH"

    else consultant == "treatment_coordinator"
      multiple_visit_route = MultipleVisitRoute.joins(:patient).where(patient: {treatment_coordinator_id: consultant_id, clinic_id: clinic_id})
      @dr = "TC" 

    end 
    
    # Search Query 
    if params[:period1].present? && params[:period2].present?
      multiple_visit_route = multiple_visit_route.where("to_char(patient.created_at, 'YYYY-mm') BETWEEN ? AND ?",params[:period1],params[:period2])
    end 

    @multiple_visits = multiple_visit_route.all.order(:created_at).group_by(&:patient_id).map{|s| s.last.last}.map{|t| t.id}
    m = @multiple_visits.join(',')
    if @multiple_visits.present?
      visit = VisitRoute.joins(:multiple_visit_route).where("multiple_visit_route_id IN (#{m})").to_a

      @first_visit = visit.pluck(:first_visit).compact.count

      @second = visit.pluck(:second).compact.count

      @treatment_plan_date = visit.pluck(:treatment_plan_date).compact.count

      @implant_correction = visit.pluck(:implant_correction).compact.count

      @self_pay_contract = visit.pluck(:self_pay_contract).count(true)

      @maintenance = visit.pluck(:maintenance).compact.count

      @treatment_plan = visit.pluck(:treatment_plan).count(true)

      @suspension = visit.pluck(:suspension).count(true)

      @confirmation_end = visit.pluck(:confirmation_end).count(true)

      @maintenance_visit = visit.pluck(:maintenance_visit).count(true)

      @suspension_contact_TEL = visit.pluck(:contact_TEL).count(true) 

      @suspended_contact_postcard = visit.pluck(:contact_postcard).count(true) 

      @visit_after_interruption = visit.pluck(:visit_after_interruption).reject{|m| m==""}.count

      @p_heavy_defense_target = visit.pluck(:p_heavy_defense_target).count(true)

      @p_heavy_defense_calculation = visit.pluck(:p_heavy_defense_calculation).count(true)

      @inspection_4mm = visit.pluck(:inspection_4mm).count(true)

      @p_second = visit.pluck(:p_second).count(true)

      @inspection_3 = visit.pluck(:inspection_3).count(true)

      @fop = visit.pluck(:fop).count(true)

      @whitening = visit.pluck(:whitening).count(true)

      @medical_tube = visit.pluck(:medical_tube).count(true)

      @prosthodontics = visit.pluck(:prosthodontics).reject{|m| m==""}.count

      @mt_tooth_number = visit.pluck(:mt_tooth_number).reject{|m| m==""}.count

      @malocclusion = visit.pluck(:malocclusion).count(true)

      @visit_count = visit.count

      @next_reservation_date = visit.pluck(:next_reservation_date).compact.count
      
    else
      @visit=[]
    end
  end 

  def initialize_variable 
    @prostho_dr = 0
    @denture_dr = 0
    @implant_dr = 0 
    @other_correc_dr = 0 
    @micro_dr = 0
    @whitening_dr = 0 

    @prostho_dr_amt = 0
    @denture_dr_amt = 0
    @implant_dr_amt = 0 
    @other_correc_dr_amt = 0 
    @micro_dr_amt = 0
    @whitening_dr_amt = 0 

    @prostho_dh = 0
    @denture_dh = 0
    @implant_dh = 0 
    @other_correc_dh = 0 
    @micro_dh = 0
    @whitening_dh = 0 

    @prostho_dh_amt = 0
    @denture_dh_amt = 0
    @implant_dh_amt = 0 
    @other_correc_dh_amt = 0 
    @micro_dh_amt = 0
    @whitening_dh_amt = 0 

    @prostho_tc = 0
    @denture_tc = 0
    @implant_tc = 0 
    @other_correc_tc = 0 
    @micro_tc = 0
    @whitening_tc = 0 

    @prostho_tc_amt = 0
    @denture_tc_amt = 0
    @implant_tc_amt = 0 
    @other_correc_tc_amt = 0 
    @micro_tc_amt = 0
    @whitening_tc_amt = 0 
  end 
  
  def monthly_tabulation(dentist,profession)
    clinic_id = current_user.clinic.id

    # Course Searching 
    if params[:period1].present? && params[:period2].present? 
      @dentist_patients = dentist.patients.where("clinic_id = ? AND to_char(patients.created_at, 'YYYY-mm') BETWEEN ? AND ?",clinic_id,params[:period1], params[:period2])

    else  
      @dentist_patients = dentist.patients.where(clinic_id: clinic_id) 
    end 
    @ah_course = @dentist_patients.where(p_course: "a").count
    @i_course =  @dentist_patients.where(p_course: "b").count
    @hare_course = @dentist_patients.where(p_course: "c").count 
    @total_p_courses = @ah_course + @i_course + @hare_course
    @unknown_course = @dentist_patients.pluck(:unknown_course).reject{|m| m == ""}.count 
    @course_a = @dentist_patients.where(course: "A").count
    @course_b = @dentist_patients.where(course: "B").count
    @course_c = @dentist_patients.where(course: "C").count
    @course_d = @dentist_patients.where(course: "D").count
    @course_e = @dentist_patients.where(course: "E").count
    @number_of_new_cases = @dentist_patients.count
    indi_count = []
    hash_data = {}
    dentist.patients.each do |patient|
      hash_data[:prostho] =  patient.counselings.last.prostho if patient.counselings.last.present?  
      prostho = indi_count << {prostho: hash_data[:prostho]} unless hash_data[:prostho].nil? || hash_data[:prostho] == ""
      hash_data[:denture] =  patient.counselings.last.denture if patient.counselings.last.present?  
      denture = indi_count << {denture: hash_data[:denture]} unless hash_data[:denture].nil?
      hash_data[:implant] =  patient.counselings.last.implant if patient.counselings.last.present?  
      implant = indi_count << {implant: hash_data[:implant]} unless  hash_data[:implant].nil?
      hash_data[:other_correc] =  patient.counselings.last.other_correc if patient.counselings.last.present?  
      other_correc = indi_count << {other_correc: hash_data[:other_correc]} unless  hash_data[:other_correc].nil? || hash_data[:other_correc] = ""
      hash_data[:micro] =  patient.counselings.last.micro if patient.counselings.last.present?  
      micro = indi_count << {micro: hash_data[:micro]} unless  hash_data[:micro].nil? || hash_data[:micro] = ""
      hash_data[:whitening] =  patient.counselings.last.whitening if patient.counselings.last.present?  
      micro = indi_count << {whitening: hash_data[:whitening]} unless  hash_data[:whitening].nil?
      # binding.pry
    end
    @prostho = indi_count.select{|x| x[:prostho]}.count
    @denture = indi_count.select{|x| x[:denture]}.count
    @implant = indi_count.select{|x| x[:implant]}.count
    @other_correc = indi_count.select{|x| x[:other_correc]}.count
    @micro = indi_count.select{|x| x[:micro]}.count
    @whitening = indi_count.select{|x| x[:whitening]}.count
    @total_dentist = @prostho + @denture + @implant + @other_correc + @micro + @whitening
    @total_amount = @prostho * 100 + @denture * 200 + @implant * 300 + @other_correc * 400 + @micro * 500 + @whitening * 600
    if profession == "dr"
      @prostho_dr += @prostho if @prostho.present? 
      @denture_dr += @denture if @denture.present? 
      @implant_dr += @implant if @implant.present? 
      @other_correc_dr += @other_correc if @other_correc.present? 
      @micro_dr += @micro if @micro.present?
      @whitening_dr += @whitening if @whitening.present?

      @prostho_dr_amt += @prostho * 100
      @denture_dr_amt += @denture * 200
      @implant_dr_amt += @implant * 300
      @other_correc_dr_amt += @other_correc * 400
      @micro_dr_amt += @micro * 500 
      @whitening_dr_amt += @whitening * 600
    end 

    if profession == "dh"
      @prostho_dh += @prostho if @prostho.present? 
      @denture_dh += @denture if @denture.present? 
      @implant_dh += @implant if @implant.present? 
      @other_correc_dh += @other_correc if @other_correc.present? 
      @micro_dh += @micro if @micro.present?
      @whitening_dh += @whitening if @whitening.present?

      @prostho_dh_amt += @prostho * 100 
      @denture_dh_amt += @denture * 200
      @implant_dh_amt += @implant * 300
      @other_correc_dh_amt += @other_correc * 400
      @micro_dh_amt += @micro * 500 
      @whitening_dh_amt += @whitening * 600
    end 

    if profession == "tc"
      @prostho_tc += @prostho if @prostho.present? 
      @denture_tc += @denture if @denture.present? 
      @implant_tc += @implant if @implant.present? 
      @other_correc_tc += @other_correc if @other_correc.present? 
      @micro_tc += @micro if @micro.present?
      @whitening_tc += @whitening if @whitening.present?

      @prostho_tc_amt += @prostho * 100
      @denture_tc_amt += @denture * 200
      @implant_tc_amt += @implant * 300
      @other_correc_tc_amt += @other_correc * 400
      @micro_tc_amt += @micro * 500 
      @whitening_tc_amt += @whitening * 600
    end 
    # binding.pry
  end

  def patient_course(couns)
    @course_a = couns[1].pluck(:course).select {|e| e == "A"}.count
    @course_b = couns[1].pluck(:course).select {|e| e == "B"}.count
    @course_c = couns[1].pluck(:course).select {|e| e == "C"}.count
    @course_d = couns[1].pluck(:course).select {|e| e == "D"}.count
    @course_e = couns[1].pluck(:course).select {|e| e == "E"}.count
    @total = @course_a+@course_b+@course_c+@course_d+@course_e
  end

  def patient_pcourse(couns)
    @ah_course = couns[1].pluck(:p_course).select {|e| e == "a"}.count
    @i_course =  couns[1].pluck(:p_course).select {|e| e == "b"}.count
    @hare_course = couns[1].pluck(:p_course).select {|e| e == "c"}.count
  end

  def overall_courses
    clinic_id = current_user.clinic.id
    patient = Patient.where(clinic_id: clinic_id).to_a
    @overall_unknown_course = patient.pluck(:unknown_course).reject{|m| m == ""}.count 
    @overall_course_a = patient.pluck(:course).count("A")
    @overall_course_b = patient.pluck(:course).count("B")
    @overall_course_c = patient.pluck(:course).count("C")
    @overall_course_d = patient.pluck(:course).count("D")
    @overall_course_e = patient.pluck(:course).count("E")
    @overall_course_ah = patient.pluck(:p_course).count("a")
    @overall_course_i = patient.pluck(:p_course).count("b")
    @overall_course_hare = patient.pluck(:p_course).count("c")
    @total_p_course = @overall_course_ah + @overall_course_i + @overall_course_hare
    @number_of_new_cases = patient.count
    # binding.pry
  end
end
