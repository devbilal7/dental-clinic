class Users::MasqueradesController < Devise::MasqueradesController

  def show
  session[:admin_id] = current_user.id
  user = User.find(params[:user_id])
  sign_in(user)
  redirect_to root_path, notice: "Now masquerading as #{user.email}"
end

def back
  user = User.find(session[:admin_id])
  sign_in :user, user
  session[:admin_id] = nil
  redirect_to user_session_path, notice: "Stopped masquerading"
end
end
