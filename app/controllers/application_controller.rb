class ApplicationController < ActionController::Base
  #helper :all
  protect_from_forgery
  helper_method :current_user
  before_filter :logger_start
  #before_filter :require_login

  def logger_start
   logger.debug "===> #{params[:controller]}:#{params[:action]} <===================="
  end
private
  def require_login
    unless current_user
      redirect_to login_url, :notice => "You must log in."
      return false
    else
      return true
    end
  end
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end
