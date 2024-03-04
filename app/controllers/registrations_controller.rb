class RegistrationsController < ApplicationController
    before_action :authorize_only, except: [:clinic_edit,:edit,:update,:clinic_update] 
    before_action :update_auth, only: [:edit, :clinic_edit, :update, :clinic_update] 
    layout "dashboard"

    def index    
        @users = ClinicSearchFilter.new(params).search_filter.includes(:clinic)

        # Sorting 
        if params[:direction].present? 
            @users = @users.order(created_at: params[:direction].to_sym)
        else  
            @users = @users.order(created_at: :desc)
        end 
    
        # Pagination
        if params[:pagy_default].present? 
            @pagy, @users = pagy(@users,items: params[:pagy_default].to_i)
        else  
            @pagy, @users = pagy(@users)
        end 
  
    end 

    def admin_index    
        @users = AdminSearchFilter.new(params).search_filter.includes(:clinic)
    
        # Pagination
        if params[:pagy_default].present? 
            @pagy, @users = pagy(@users,items: params[:pagy_default].to_i)
        else  
            @pagy, @users = pagy(@users)
        end 
            
    end 

    def new_admin 
        @user = User.new 
    end 

    def create_admin 
        @user = User.new(params_administrator)
        if @user.save
            redirect_to admin_index_registrations_path, notice: "New Admin Created Successfully" 
        else  
            render :new_admin
        end 
    end 

    def admin_edit 
        @user = User.find(params[:id])
        respond_to do |format|
            format.js
        end
    end 
    
    def admin_update
        @user = User.find(params[:id])
        if @user.update(params_administrator)
            redirect_to admin_index_registrations_path, notice: "User #{@user.email} Successfully Updated!"
        else  
            render :admin_edit 
        end 
    end 

    def new 
        @user = User.new 
        @user.build_clinic
    end 

    def create 
        @user = User.new(params_clinic_user)
        @user.role = "ClinicUser"
        if @user.save
            redirect_to registrations_path, notice: "New User Created Successfully!"
        else  
            render :new
        end 
    end 

    def edit 
        @user = User.find(params[:id])
        respond_to do |format|
            format.js
        end
    end 
    
    def update
        @user = User.find(params[:id])
        if @user.update(params_clinic_user)
            redirect_to registrations_path, notice: "User #{@user.email} Successfully Updated!"
        else  
            render :edit 
        end 
    end 

    def clinic_edit 
        @user = User.find(params[:id])
        unless @user.logo.present?
            @user.logo.blob
        end
    end 

    def clinic_update 
        @user = User.find(params[:id])
        user_check = User.where("email = ?",params[:user][:email]).first
        if user_check.valid_password?(params[:user][:check_password])
            @user.update(params_clinicedit)
            redirect_to clinic_edit_registration_path(current_user.id), notice: "User #{@user.email} Successfully Updated!"
        else  
            render :clinic_edit
        end 
    end     

    def destroy
        begin
            @user = User.find(params[:id])
            role = @user.role 
            @user.destroy 
            
            if role == "ClinicUser"
                redirect_to registrations_path, notice: "User #{@user.email} was successfully Deleted!"
            else  
                redirect_to admin_index_registrations_path, notice: "User #{@user.email} was successfully Deleted!"               
            end 
        rescue =>e
            @error= e.message
            if role == "ClinicUser"
                redirect_to registrations_path, notice: "Unsuccessfull!, Account Is Still Available!"
            else  
                redirect_to admin_index_registrations_path, notice: "Unsuccessfull!, Account Is Still Available!"               
            end 
            # redirect_to user_index_path, notice: "Unsuccessfull!, Account Is Still Available!"
        end 
    end 
    
    
    private 

        def authorize_only 
            unless current_user.role == "Administrator"
                redirect_to root_path 
            end 
        end 

        def update_auth 
            if current_user.id != params[:id].to_i && current_user.role != "Administrator"
                redirect_to root_path 
            end 
        end 
      
        def user_params 
            params.require(:user).permit(:role, :email, :logo)
        end 

        def params_administrator 
            params.require(:user).permit(:email, :password, :password_confirmation, :role, :logo, :first_name, :last_name, :kana_first_name, :kana_last_name, :usage_classification)
        end 

        def params_clinic_user 
            params.require(:user).permit(:email, :password, :password_confirmation, :role, :usage_classification, clinic_attributes: [:id, :name, :postal_code, :region, :address, :municipalities, :floors, :building_name, :fax_number, :phone_number, :representative_first_name, :representative_last_name, :representative_wonder1, :representative_wonder2, :charge1_first_name, :charge1_last_name, :charge1_wonder1, :charge1_wonder2, :charge2_first_name, :charge2_last_name, :charge2_wonder1, :charge2_wonder2])
        end 

        def params_clinicedit 
            params.require(:user).permit(:email, :role, :logo, clinic_attributes: [:id, :name, :postal_code, :region, :address, :municipalities, :building_name, :floors, :fax_number, :phone_number, :representative_first_name, :representative_last_name, :representative_wonder1, :representative_wonder2, :charge1_first_name, :charge1_last_name, :charge1_wonder1, :charge1_wonder2, :charge2_first_name, :charge2_last_name, :charge2_wonder1, :charge2_wonder2])
        end 
end