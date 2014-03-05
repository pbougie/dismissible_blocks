class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:username].present?
      @current_user ||= User.find_by(username: session[:username])
    end
  end
  helper_method :current_user

  def check_authentication
    unless session[:username].present?
      raise Dummy::Unauthorized
    end
  end

  def authenticated?
    session[:username].present?
  end


  def signin(username)
    session[:username] = username
  end

  def signout
    reset_session
  end
end
