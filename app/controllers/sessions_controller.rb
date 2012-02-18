class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create, :destroy]

  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now[:alert] = "Invalid username or password"
      render :action => "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
