class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid username or password"
      render :action => "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path
  end
end
