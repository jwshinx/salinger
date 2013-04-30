class HomeController < ActionController::Base
  protect_from_forgery
  layout 'application'

  def index
   logger.debug "---> HC.index 0"
   logger.debug "---> HC.index 10"
  end

  def email_signup 
   logger.debug "---> HC.email_signup 0"
   if params[:color].blank?
    logger.debug "---> HC.email_signup 1.1"
    flash[:email_signup_notice] = "color blank! #{params[:email]}"
   else
    logger.debug "---> HC.email_signup 1.2"
    flash[:email_signup_notice] = "color not blank! #{params[:email]}"
   end
   logger.debug "---> HC.email_signup 10"
   redirect_to root_url
  end
end
