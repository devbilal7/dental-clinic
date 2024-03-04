class DentistAggregationsController < ApplicationController
  before_action :set_dentist_aggregation, only: %i[ show edit update destroy ]
  layout 'dashboard'

  # GET /dentist_aggregations or /dentist_aggregations.json
  def index
    @dentist_aggregations, @year, @month = DrAggregation::SearchFilter.new(params,current_user.clinic.id).index_search
    @index = 0

    # Pagination
    if params[:pagy_default].present? 
      @pagy, @dentist_aggregations = pagy(@dentist_aggregations,items: params[:pagy_default].to_i)
    else  
      @pagy, @dentist_aggregations = pagy(@dentist_aggregations)
    end 
  end

  # GET /dentist_aggregations/1 or /dentist_aggregations/1.json
  def show
  end

  # GET /dentist_aggregations/new
  def new
    @dentist_aggregation = DentistAggregation.new
  end

  # GET /dentist_aggregations/1/edit
  def edit
  end

  # POST /dentist_aggregations or /dentist_aggregations.json
  def create
    @dentist_aggregation = DentistAggregation.new(dentist_aggregation_params)

    respond_to do |format|
      if @dentist_aggregation.save
        format.html { redirect_to dentist_aggregations_path, notice: "Dentist aggregation was successfully created." }
        format.json { render :show, status: :created, location: @dentist_aggregation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dentist_aggregation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dentist_aggregations/1 or /dentist_aggregations/1.json
  def update
    respond_to do |format|
      if @dentist_aggregation.update(dentist_aggregation_params)
        format.html { redirect_to dentist_aggregations_path, notice: "Dentist aggregation was successfully updated." }
        format.json { render :show, status: :ok, location: @dentist_aggregation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dentist_aggregation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dentist_aggregations/1 or /dentist_aggregations/1.json
  def destroy
    @dentist_aggregation.destroy

    respond_to do |format|
      format.html { redirect_to dentist_aggregations_url, notice: "Dentist aggregation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def monthly_tabulation 
    if params[:month].present? && params[:year].present? 
      @month = params[:month]
      @year = params[:year]
    else  
      @month = Date.today.strftime("%m")
      @year = Date.today.strftime("%Y")
    end 
    @dentists = Dentist.all 
    @total_dentists = 0
    @total_dentist_aggregations = DentistAggregation.where(clinic_id: current_user.clinic.id).where('extract(year from created_at) = ?', @year).where('extract(month from created_at) = ?', @month)
    @index = 0

    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "", template: "dentist_aggregations/monthly_tabulation", formats: [:html], layout: "pdf", orientation: "landscape"
      end
    end
  end 

  def annual_tabulation 
    @total_months = 0
    @hash,@annual_aggregations = DrAggregation::SearchFilter.new(params,current_user.clinic.id).search_filter

    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "", template: "dentist_aggregations/annual_tabulation", formats: [:html], layout: "pdf", orientation: "landscape"
      end
    end
  end 

  def annual_tabulation_graph 
    unless params[:date].present? 
      @year = Date.today.strftime("%Y")
    else  
      @year = params[:date][:year]
    end 
    @dentist_aggregations = DentistAggregation.where(clinic_id: current_user.clinic.id)
  end
  
  def annual_individual_graph 
    unless params[:date].present? && params[:responsible_person].present?
      @year = Date.today.strftime("%Y")
      @dentist_aggregations = DentistAggregation.where(clinic_id: current_user.clinic.id)
    else  
      @year = params[:date][:year]
      @dentist_aggregations = DentistAggregation.where(clinic_id: current_user.clinic.id,dentist_id: params[:responsible_person])
    end  
  end 

  def annual_tabulation_individual
    @total_months = 0
    @hash,@annual_aggregations = DrAggregation::SearchFilter.new(params,current_user.clinic.id).search_filter 

    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "", template: "dentist_aggregations/annual_tabulation_individual", formats: [:html], layout: "pdf", orientation: "landscape"
      end
    end
  end 

  def individual_graph 
    @dentist_aggregations = DrAggregation::SearchFilter.new(params,current_user.clinic.id).individual_graph
  end 
      

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dentist_aggregation
      @dentist_aggregation = DentistAggregation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dentist_aggregation_params
      params.require(:dentist_aggregation).permit(:no_of_reservations, :actual_visit_patients, :insurance_peoples, :emergency_patients, :new_patients, :re_entry_patients, :patients_finished, :no_of_cancellations, :no_notice_cancellations, :score, :own_expense_amount_money, :miscellaneous_income, :own_expense_people, :no_of_people, :actual_examinations, :referral_card, :referral_patients, :people_returning_home, :payment_people, :through_no_of_reservations, :through_rate, :actual_visit_peoples, :introduction_card, :introduction_patients, :referral_rate,:clinic_id, :dentist_id)
    end
end
