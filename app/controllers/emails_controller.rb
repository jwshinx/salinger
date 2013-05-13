class EmailsController < ApplicationController
  layout 'email'
  load_and_authorize_resource :except => [:create]

  def index
    @emails = Email.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emails }
    end
   end

   def create
    @email = Email.new(params[:email])
    @email.email_type = EmailType.find_by_name( 'Email Signup' )
    respond_to do |format|
      if @email.save
        format.html { redirect_to root_url, notice: 'Email was successfully created.' }
        format.json { render json: @email, status: :created, location: @email }
      else
        #format.html { render action: "new" }
        format.html { render 'home/index', :layout => 'application' }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @email = Email.find(params[:id])
    respond_to do |format|
      if @email.update_attributes(params[:email])
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url }
      format.json { head :no_content }
    end
  end
end
