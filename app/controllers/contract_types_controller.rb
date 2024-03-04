class ContractTypesController < ApplicationController
  layout "dashboard"
  before_action :set_contract_type, only: %i[ show edit update destroy ]

  # GET /contract_types or /contract_types.json
  def index
    @contract_types = ContractType.all
  end

  # GET /contract_types/1 or /contract_types/1.json
  def show
  end

  # GET /contract_types/new
  def new
    @contract_type = ContractType.new
  end

  # GET /contract_types/1/edit
  def edit
  end

  # POST /contract_types or /contract_types.json
  def create
    @contract_type = ContractType.new(contract_type_params)

    respond_to do |format|
      if @contract_type.save
        format.html { redirect_to master_admin_admin_managements_path(tab: "button-contract-type"), notice: "Contract type was successfully created." }
        format.json { render :show, status: :created, location: @contract_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contract_types/1 or /contract_types/1.json
  def update
    respond_to do |format|
      if @contract_type.update(contract_type_params)
        format.html { redirect_to contract_type_url(@contract_type), notice: "Contract type was successfully updated." }
        format.json { render :show, status: :ok, location: @contract_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_types/1 or /contract_types/1.json
  def destroy
    @contract_type.destroy

    respond_to do |format|
      format.html { redirect_to contract_types_url, notice: "Contract type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_type
      @contract_type = ContractType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contract_type_params
      params.require(:contract_type).permit(:contract_type_code, :contract_type_name, :remarks, :master_name)
    end
end
