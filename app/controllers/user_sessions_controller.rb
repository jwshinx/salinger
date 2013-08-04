class UserSessionsController < ApplicationController
  include Formatable 
  include ConsumeApiConcerns 
  
  layout "user_session"
                                                                        
  def new
    logger_start
    @user_session = UserSession.new
    @sonoma_weather = find_sonoma_weather   
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to( my_tasks_url, :notice => 'Login Successful') }
        format.xml { render :xml => @user_session, :status => :created, :location => @user_session }
      else                      
        @sonoma_weather = find_sonoma_weather
        format.html { render :action => "new" }
        format.xml { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to( root_url , :notice => 'Goodbye!') }
      format.xml { head :ok }
    end
  end
end
