class ApplicationController < ActionController::Base
    before_action :masquerade!
    before_action :authenticate_user!
    include Pundit::Authorization
    before_action :set_locale
    include Pagy::Backend
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

     protected
      def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password, :password_confirmation)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :email, :password, :current_password)}
      end

      # def after_sign_up_path_for(resource)
      #   binding.pry
      #   new_company_path
      # end

  private
  def user_not_authorized    
    flash[:alert] =" You are not authorized to perform this action."
    end

  def set_locale
    I18n.locale = "ja"
  end

  def after_sign_out_path_for(resource)
    reset_session
    root_url
  end

  def after_sign_in_path_for(resource)
    #To Get Ip of signed in Clinic
    require "uri"
    require "net/http"

    url = URI("https://www.cloudflare.com/cdn-cgi/trace")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = "application/json"
    request["X-API-Key"] = "MY-API-KEY"
    response = https.request(request) 
    response_data = response.body.split("\n")
    obj_data = {}
    response_data.each do |data|
      arr = data.split("=")
      obj_data[arr[0]] = arr[1]
    end
    current_clinic = Clinic.find_by(user_id: current_user.id)
    if !current_clinic.nil?
      ClinicIp.create(ip: obj_data["ip"], last_login: current_user.last_sign_in_at, clinic_id: current_user.clinic.id)
    end
    root_url
  end

  def after_sign_in_path_for(resource)
    if resource.role == 'Administrator'
      client_management_admin_managements_path
    else  
      root_path
    end
  end

end
