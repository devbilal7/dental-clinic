class HomepageController < ApplicationController
  layout "dashboard"
  def home  
    if current_user.role == "Administrator"
      @users_count = User.count 
      @patient_count = Patient.any? ? Patient.all.count : 0 
      dentist_aggregation = DentistAggregation.all
      dh_aggregation = DhAggregation.all
      @counseling_count = Counseling.any? ? Counseling.all.count : 0
    else  
      clinic_id = current_user.clinic.id
      @patient_count = Patient.any? ? Patient.where(clinic_id: clinic_id).count : 0
      dentist_aggregation = DentistAggregation.where(clinic_id: clinic_id)
      dh_aggregation = DhAggregation.where(clinic_id: clinic_id)
      @counseling_count = Counseling.any? ? Counseling.joins(:patient).where(patient: {clinic_id: clinic_id}).count : 0
    end 
    dr_self_pay_amount = dentist_aggregation.pluck(:own_expense_amount_money).sum 
    dr_self_pay_people = dentist_aggregation.pluck(:own_expense_people).sum
    dr_reserve_people = dentist_aggregation.pluck(:no_of_reservations).sum 

    dh_self_pay_amount = dh_aggregation.pluck(:own_income).sum 
    dh_self_pay_people = dh_aggregation.pluck(:people_own_expense).sum 
    dh_reserve_people = dh_aggregation.pluck(:no_of_reservations).sum

    @self_pay_amount = dr_self_pay_amount + dh_self_pay_amount 

    @self_pay_rate = (dr_self_pay_people + dh_self_pay_people).zero? ? 0 : (dr_self_pay_people + dh_self_pay_people).to_f/(dr_reserve_people + dh_reserve_people).to_f * 100
  end

  def translate
    if params[:locale] == 'en'
      session[:translate]= 'en'
    else 
      session[:translate]= "ja"
    end
    redirect_to request.referer
  end
end
