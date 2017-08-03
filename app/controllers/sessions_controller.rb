class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(auth_hash)
    session[:id] = @user.id
    redirect_to dashboards
  end

  def destroy
    session.clear
    redirect_to welcome_path
  end

  private
  def dashboards
    if current_user.role == "instructor"
      instructor_dashboard_path
    else
      user_path(@user)
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
