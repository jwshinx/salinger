class HomeController < ActionController::Base
  protect_from_forgery
  def index
   render :layout => 'application'
  end

  def incubating_one
   render :layout => 'application'
  end
  def incubating_two 
   render :layout => 'application'
  end
  def incubating_three 
   render :layout => 'application'
  end
end
