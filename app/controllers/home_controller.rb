class HomeController < ActionController::Base
  protect_from_forgery
  layout 'application'

  def index
   @email = Email.new
  end

  def email_signup 
   if params[:color].blank?
    flash[:email_signup_notice] = "color blank! #{params[:email]}"
   else
    flash[:email_signup_notice] = "color not blank! #{params[:email]}"
   end
   redirect_to root_url
  end
end
