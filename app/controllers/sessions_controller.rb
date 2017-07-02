class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(auth_hash)
    session[:id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
    redirect_to welcome_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
