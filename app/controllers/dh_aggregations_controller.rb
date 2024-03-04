class DhAggregationsController < ApplicationController
  layout "dashboard"
  before_action :set_dh_aggregation, only: %i[ show edit update destroy ]

  # GET /dh_aggregations or /dh_aggregations.json
  def index
    @dh_aggregations, @year, @month = DhyAggregation::SearchFilter.new(params,current_user.clinic.id).index_search
    @index = 0
  end

  # GET /dh_aggregations/1 or /dh_aggregations/1.json
  def show
  end

  # GET /dh_aggregations/new
  def new
    @dh_aggregation = DhAggregation.new
  end

  # GET /dh_aggregations/1/edit
  def edit
  end

  # POST /dh_aggregations or /dh_aggregations.json
  def create
    @dh_aggregation = DhAggregation.new(dh_aggregation_params)

    respond_to do |format|
      if @dh_aggregation.save
        format.html { redirect_to dh_aggregations_path, notice: "Dh aggregation was successfully created." }
        format.json { render :show, status: :created, location: @dh_aggregation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dh_aggregation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dh_aggregations/1 or /dh_aggregations/1.json
  def update
    respond_to do |format|
      if @dh_aggregation.update(dh_aggregation_params)
        format.html { redirect_to dh_aggregations_path, notice: "Dh aggregation was successfully updated." }
        format.json { render :show, status: :ok, location: @dh_aggregation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dh_aggregation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dh_aggregations/1 or /dh_aggregations/1.json
  def destroy
    @dh_aggregation.destroy

    respond_to do |format|
      format.html { redirect_to dh_aggregations_url, notice: "Dh aggregation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  def dh_monthly_tabulation
    if params[:month].present? && params[:year].present? 
      @month = params[:month]
      @year = params[:year]
   else  
      @month = Date.today.strftime("%m")
      @year = Date.today.strftime("%Y")
   end
    @dentist_hygienists = DentistHygienist.all
    @dh_aggregations = DhAggregation.where(clinic_id: current_user.clinic.id)

    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "", template: "dh_aggregations/dh_monthly_tabulation", formats: [:html], layout: "pdf", orientation: "landscape"
      end
    end
  end

  def dh_yearly_stats
    @dentist_hygienists = DentistHygienist.all
    @hash,@dh_aggregations = DhyAggregation::SearchFilter.new(params,current_user.clinic.id).search_filter
    @last_year_average = DhAggregation.where(clinic_id: 1).where('extract(year from created_at) = ?', Date.today.strftime("%Y").to_i - 1)

    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "", template: "dh_aggregations/dh_yearly_stats", formats: [:html], layout: "pdf", orientation: "landscape"
      end
    end
  end

  def dh_yearly_stats_doc 
     @dentist_hygienists = DentistHygienist.all
     @hash,@dh_aggregations = DhyAggregation::SearchFilter.new(params,current_user.clinic.id).search_filter
     @last_year_average = DhAggregation.where(clinic_id: 1).where('extract(year from created_at) = ?', Date.today.strftime("%Y").to_i - 1)

     respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "", template: "dh_aggregations/dh_yearly_stats_doc", formats: [:html], layout: "pdf", orientation: "landscape"
      end
    end
  end

  def dh_yearly_stats_graph 
    @dh_aggregations = DhAggregation.where(clinic_id: current_user.clinic.id)
  end

  def dh_yearly_stats_cancel_graph
    @dentist_hygienists = DentistHygienist.all
    @hash,@dh_aggregations = DhyAggregation::SearchFilter.new(params,current_user.clinic.id).search_filter
  end

  def dh_yearly_stats_doc_cancel_graph
    @dentist_hygienists = DentistHygienist.all
    @hash,@dh_aggregations = DhyAggregation::SearchFilter.new(params,current_user.clinic.id).search_filter
  end

  def dh_yearly_stats_doc_graph
    @dh_aggregations = DhyAggregation::SearchFilter.new(params,current_user.clinic.id).individual_graph
  end 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dh_aggregation
      @dh_aggregation = DhAggregation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dh_aggregation_params
      params.require(:dh_aggregation).permit(:no_of_reservations, :people_maintenance, :people_treatment, :people_own_expense, :oral_count, :out_of_the_decline, :cancellation_tel, :cancellation_without, :insurance_maintenance, :insurance_treatment, :own_income, :miscc_income, :no_of_people, :appt_confm_people, :interval_1m_people, :interval_1m_tel, :interval_1m_without, :interval_2m_people, :interval_2m_tel, :interval_2m_without, :interval_3m_people, :interval_3m_tel, :interval_3m_without, :interval_4m_people, :interval_4m_tel, :interval_4m_without, :interval_6m_people, :interval_6m_tel, :interval_6m_without, :spt2, :spt1, :g_p_heavy_defense, :no_of_referrals, :note, :dentist_hygienist_id, :clinic_id, :oral_func, :med_prac_rev, :act_med_exam_days, :one_day_no_reservation)
    end
end
