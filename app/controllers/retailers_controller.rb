class RetailersController < ApplicationController
  layout "retailer"
  load_and_authorize_resource 
  include Trackable
  
  def index
    #@retailers = Retailer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @retailers }
    end
  end

  def show
    #@retailer = Retailer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @retailer }
    end
  end

  def new
    #@retailer = Retailer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @retailer }
    end
  end

  def edit
    #@retailer = Retailer.find(params[:id])
  end

  def create
    #@retailer = Retailer.new(params[:retailer])
    set_creator_and_updater @retailer, current_user    

    respond_to do |format|
      if @retailer.save
        format.html { redirect_to @retailer, notice: 'Retailer was successfully created.' }
        format.json { render json: @retailer, status: :created, location: @retailer }
      else
        format.html { render action: "new" }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@retailer = Retailer.find(params[:id])
    @retailer.updater = current_user

    respond_to do |format|
      if @retailer.update_attributes(params[:retailer])
        format.html { redirect_to @retailer, notice: 'Retailer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@retailer = Retailer.find(params[:id])
    @retailer.destroy

    respond_to do |format|
      format.html { redirect_to retailers_url }
      format.json { head :no_content }
    end
  end
end
