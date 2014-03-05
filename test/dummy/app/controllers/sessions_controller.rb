class SessionsController < ApplicationController
  before_filter :check_authentication, only: :destroy

  def new
    if authenticated?
      flash[:notice] = 'You are already logged in.'
      redirect_to landing_url
    end
  end

  def create
    user = User.authenticate params[:username], params[:password]
    if user
      signin user.username
      flash[:notice] = 'You have been logged in.'
      redirect_to landing_url
    else
      flash.now[:alert] = 'Your username and/or password are incorrect.'
      render :new
    end
  end

  def destroy
    signout
    flash[:notice] = 'You have been logged out.'
    redirect_to login_url
  end
end
