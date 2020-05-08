class TwitterSessionsController < ApplicationController
  def create
    @user = TwitterUser.where(uid: auth_hash[:uid], provider: auth_hash[:provider]).first_or_create
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "Sucessfully logged out!"
    end
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end


end

