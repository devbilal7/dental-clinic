# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    # super
    unless current_user.present? 
      redirect_to new_user_session_path
    end 
  end

  # POST /resource
  # def create
  #   super
  # end

  def destroy
    user = User.find(params[:id])
    user.destroy
    abort()
    redirect_to request.referer, notice: "#{user.name} Successfully Deleted"
  end

  # GET /resource/edit
  def edit
    @user = User.find(params[:id])
    # layout: dashboard
  end

  # PUT /resource
  def update
    @user = User.find(params[:id]) 
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_index_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private 

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
