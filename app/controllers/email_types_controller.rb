class EmailTypesController < ApplicationController
  layout 'email_type'
  load_and_authorize_resource

  def index
    #@email_types = EmailType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @email_types }
    end
  end

  def show
    #@email_type = EmailType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email_type }
    end
  end

  def new
    #@email_type = EmailType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_type }
    end
  end

  def edit
    #@email_type = EmailType.find(params[:id])
  end

  def create
    #@email_type = EmailType.new(params[:email_type])

    respond_to do |format|
      if @email_type.save
        format.html { redirect_to @email_type, notice: 'Email type was successfully created.' }
        format.json { render json: @email_type, status: :created, location: @email_type }
      else
        format.html { render action: "new" }
        format.json { render json: @email_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@email_type = EmailType.find(params[:id])

    respond_to do |format|
      if @email_type.update_attributes(params[:email_type])
        format.html { redirect_to @email_type, notice: 'Email type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@email_type = EmailType.find(params[:id])
    @email_type.destroy

    respond_to do |format|
      format.html { redirect_to email_types_url }
      format.json { head :no_content }
    end
  end
end
