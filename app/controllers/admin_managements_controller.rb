class AdminManagementsController < ApplicationController
  before_action :authorize_only, except: [:master_admin]
  layout "dashboard"

  def client_management
    @q = Clinic.ransack(params[:q])
    @pagy, @clinics = pagy(@q.result) 
    @regions = {
                "北海道" => ["北海道"],
                "東北" => ["青森", "岩手", "宮城", "秋田", "山形", "福島"],
                "関東" => ["茨城", "栃木", "群馬", "埼玉", "千葉", "東京", "神奈川"],
                "中部" => ["新潟", "富山", "石川", "福井", "山梨", "長野", "岐阜", "静岡", "愛知"],
                "キンキ" => ["三重", "滋賀", "京都", "大阪", "兵庫", "奈良", "和歌山"],
                "中国地方 / 四国" => ["鳥取", "島根", "岡山", "広島", "山口", "徳島", "香川", "愛媛", "高知"],
                "九州" => ["福岡", "佐賀", "長崎", "熊本", "大分", "宮崎", "鹿児島", "沖縄"]
              }
  end


  def system_management 
    @q = ClinicIp.ransack(params[:q])
    @pagy, @clinic_ips = pagy(@q.result)
    @version_controls = VersionControl.where(user_id: current_user.id)
    @version_control = VersionControl.new()
  end 
  
  def document_management
    @documents = current_user.documents
  end

  def upload_document
    @user = User.find(current_user.id)
    @user.documents.attach(io: File.open(params[:documents].path),filename: params[:documents].original_filename)
    redirect_to document_management_admin_managements_path, notice: "Document #{@user.documents.last.filename} Successfully Uploaded!"
  end

  def destroy_document
    @document = current_user.documents.find(params[:id])
    @document.purge
    redirect_to document_management_admin_managements_path, notice: "Document #{@document.filename} Successfully Deleted!"
  end

  def master_admin
  end

  def upload_version_control_document
    @version_control = VersionControl.new(version_control_params)
    if @version_control.document.present?
      @version_control.document.attach(io: File.open(params[:version_control][:document].path),filename: params[:version_control][:document].original_filename)
      @version_control.user_id = current_user.id
      if @version_control.save 
        redirect_to system_management_admin_managements_path, notice: "Version Control #{@version_control.title} Successfully Created!"
      else  
          render :new, status: :unprocessable_entity
      end  
    else
      redirect_to system_management_admin_managements_path, alert: "Please Choose file for uploading........"
    end
       
  end
  # def change_pass 
  #   @user = User.find(params[:id])
  # end 

  # def update_pass 
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to user_index_path, notice: "User #{@user.email} Successfully Updated!"
  #   end 
  # end 

  # private 

  # def user_params 
  #   params.require(:user).permit(:role,:email)
  # end 

  private 

  def version_control_params
    params.require(:version_control).permit(:title, :date_field, :document)
  end


  def authorize_only
    unless current_user.role == "Administrator"
      redirect_to root_path 
    end 
  end 
end
